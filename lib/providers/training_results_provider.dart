import 'package:ak_kurim_app/models/views/group_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/views/full_meet_view.dart';
import '../models/views/meet_event_view.dart';
import '../models/views/simple_athlete_view.dart';
import './db_provider.dart';
import './simple_athletes_provider.dart';
import 'package:drift/drift.dart';
import 'package:collection/collection.dart';
import './meet_providers.dart';
import '../models/views/discipline_view.dart';
import '../services/network/sync_service.dart';
import '../services/database/drift_database.dart';
import '../utils/utils.dart';
import 'package:uuid/uuid.dart';
import '../services/auth/auth_service.dart';
import 'dart:convert';

part 'training_results_provider.g.dart';

@riverpod
class TrainingResultsP extends _$TrainingResultsP {
  @override
  Stream<List<FullMeetView>> build() async* {
    final db = ref.read(dbProvider);
    final monthYear = ref.watch(selectedMonthYearPProvider);
    final DateTime startDate = DateTime(monthYear.year, monthYear.month, 1);
    final DateTime endDate = DateTime(monthYear.year, monthYear.month + 1, 0);
    final List<SimpleAthleteView> athletes =
        await ref.watch(simpleAthletesPProvider.future);

    final query = (db.select(db.meet)
          ..where(
            (tbl) =>
                tbl.deletedAt.isNull() &
                tbl.startAt.isBetweenValues(startDate, endDate) &
                tbl.id.contains('TRA'),
          )
          ..orderBy(
            [
              (tbl) => OrderingTerm(
                    expression: tbl.startAt,
                    mode: OrderingMode.asc,
                  ),
            ],
          ))
        .join(
      [
        leftOuterJoin(db.meetEvent, db.meetEvent.meetId.equalsExp(db.meet.id)),
        leftOuterJoin(db.discipline,
            db.discipline.id.equalsExp(db.meetEvent.disciplineId)),
        leftOuterJoin(
            db.category, db.category.id.equalsExp(db.meetEvent.categoryId)),
        leftOuterJoin(db.athleteMeetEvent,
            db.athleteMeetEvent.meetEventId.equalsExp(db.meetEvent.id)),
      ],
    );

    yield* query.watch().map((rows) {
      final grouped = groupBy(rows, (row) => row.readTable(db.meet).id);

      return grouped.entries.map((entry) {
        final meet = entry.value.first.readTable(db.meet);
        List<MeetEventView> events = [];
        for (final row in entry.value) {
          final event = row.readTableOrNull(db.meetEvent);
          final discipline = row.readTableOrNull(db.discipline);
          final category = row.readTableOrNull(db.category);
          if (event == null || discipline == null || category == null) {
            continue;
          }
          events.add(MeetEventView(
            meetEvent: event,
            discipline: discipline,
            category: category,
            athletesWithResults: {},
          ));
        }

        List<MeetEventView> events_ = [];
        for (final event in events) {
          if (events_.isEmpty) {
            events_.add(event);
          } else {
            final lastEvent = events_.last;
            if (lastEvent == event) {
              continue;
            } else {
              events_.add(event);
            }
          }
        }
        events = events_;

        final athleteMeetEvents = entry.value
            .map((row) => row.readTableOrNull(db.athleteMeetEvent))
            .nonNulls
            .toList();

        final athletesInMeet = athletes
            .where((athlete) => athleteMeetEvents.any((event) =>
                event.athleteId == athlete.athlete.id &&
                events.any((meetEvent) =>
                    meetEvent.meetEvent.id == event.meetEventId)))
            .toList();

        for (final event in events) {
          final athleteEvents = athleteMeetEvents
              .where((athleteEvent) =>
                  athleteEvent.meetEventId == event.meetEvent.id)
              .toList();

          for (final athlete in athletesInMeet) {
            final athleteEvent = athleteEvents.firstWhereOrNull(
                (athleteEvent) => athleteEvent.athleteId == athlete.athlete.id);

            if (athleteEvent != null) {
              event.athletesWithResults[athlete] = ResultView(
                result: athleteEvent.result,
                wind: athleteEvent.wind,
                pbSb: athleteEvent.pbSb,
                points: athleteEvent.points,
              );
            }
          }
        }

        return FullMeetView(
          meet: meet,
          events: events,
        );
      }).toList();
    });
  }

  Future<void> deleteTrainingResult(FullMeetView meet) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    final updated = await db.into(db.meet).insertReturning(
          mode: InsertMode.insertOrReplace,
          MeetCompanion(
            id: Value(meet.meet.id),
            name: Value(meet.meet.name),
            startAt: Value(meet.meet.startAt),
            endAt: Value(meet.meet.endAt),
            location: const Value(''),
            organizer: Value(meet.meet.organizer),
            createdAt: Value(meet.meet.createdAt),
            updatedAt: Value(DateTime.now()),
            deletedAt: Value(DateTime.now()),
          ),
        );

    await sync.addToSyncQueue(
      '/sync/meet',
      'post',
      json.encode(
        {
          'data': [Utils.convertMapKeysToSnakeCase(updated.toJson())],
          'primary_keys': ['id'],
          'table': 'meet',
        },
      ),
    );
  }

  Future<void> createTrainingResult(
    DateTime date,
    GroupView group,
    DisciplineView discipline,
    String name,
  ) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    final auth = await ref.read(authServiceProvider.future);
    String id = const Uuid().v1();
    id = 'TRA-${id.substring(4)}';

    final trainingResult = await db.into(db.meet).insertReturning(
          MeetCompanion(
            id: Value(id),
            name: Value(name),
            startAt: Value(date),
            endAt: Value(date),
            location: const Value(''),
            organizer: Value(auth.tenant ?? ''),
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
            deletedAt: const Value(null),
          ),
        );
    await sync.addToSyncQueue(
      '/sync/meet',
      'post',
      json.encode(
        {
          'data': [Utils.convertMapKeysToSnakeCase(trainingResult.toJson())],
          'primary_keys': ['id'],
          'table': 'meet',
        },
      ),
    );
    final meetEventId = const Uuid().v1();
    final meetEvent = await db.into(db.meetEvent).insertReturning(
          MeetEventCompanion(
            id: Value(meetEventId),
            meetId: Value(id),
            meetType: const Value('Training'),
            disciplineId: Value(discipline.discipline.id),
            startAt: Value(date),
            phase: const Value(''),
            categoryId: const Value(0),
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
            deletedAt: const Value(null),
          ),
        );
    await sync.addToSyncQueue(
      '/sync/meet_event',
      'post',
      json.encode(
        {
          'data': [Utils.convertMapKeysToSnakeCase(meetEvent.toJson())],
          'primary_keys': ['id'],
          'table': 'meet_event',
        },
      ),
    );

    List<AthleteMeetEventData> athleteMeetEvents = [];
    for (final athlete in group.athletes) {
      final data = await db.into(db.athleteMeetEvent).insertReturning(
            AthleteMeetEventCompanion(
              athleteId: Value(athlete.athlete.id),
              meetEventId: Value(meetEventId),
              result: const Value(''),
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
              deletedAt: const Value(null),
            ),
          );
      athleteMeetEvents.add(data);
    }

    await sync.addToSyncQueue(
      '/sync/athlete_meet_event',
      'post',
      json.encode(
        {
          'data': athleteMeetEvents
              .map((e) => Utils.convertMapKeysToSnakeCase(e.toJson()))
              .toList(),
          'primary_keys': ['athlete_id', 'meet_event_id'],
          'table': 'athlete_meet_event',
        },
      ),
    );
  }

  Future<void> saveTrainingResult(
    String athleteId,
    MeetEventData meetEvent,
    String result,
  ) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    final updated = await db.into(db.athleteMeetEvent).insertReturning(
          mode: InsertMode.insertOrReplace,
          AthleteMeetEventCompanion(
            athleteId: Value(athleteId),
            meetEventId: Value(meetEvent.id),
            result: Value(result),
            createdAt: Value(meetEvent.createdAt!),
            updatedAt: Value(DateTime.now()),
            deletedAt: const Value(null),
          ),
        );

    await sync.addToSyncQueue(
      '/sync/athlete_meet_event',
      'post',
      json.encode(
        {
          'data': [Utils.convertMapKeysToSnakeCase(updated.toJson())],
          'primary_keys': ['athlete_id', 'meet_event_id'],
          'table': 'athlete_meet_event',
        },
      ),
    );
  }
}
