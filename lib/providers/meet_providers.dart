import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/database/drift_database.dart';
import '../models/views/discipline_view.dart';
import '../models/views/month_year_view.dart';
import '../models/views/full_meet_view.dart';
import '../models/views/meet_event_view.dart';
import '../models/views/simple_athlete_view.dart';
import './db_provider.dart';
import './simple_athletes_provider.dart';
import 'package:drift/drift.dart';
import '../utils/utils.dart';
import 'package:collection/collection.dart';

part 'meet_providers.g.dart';

@riverpod
class MeetProvidersP extends _$MeetProvidersP {
  @override
  Stream<List<FullMeetView>> build() async* {
    final db = ref.read(dbProvider);
    final month_year = ref.watch(selectedMonthYearPProvider);
    final DateTime startDate = DateTime(month_year.year, month_year.month, 1);
    final DateTime endDate = DateTime(month_year.year, month_year.month + 1, 0);
    final List<SimpleAthleteView> athletes =
        await ref.watch(simpleAthletesPProvider.future);

    final query = (db.select(db.meet)
          ..where(
            (tbl) =>
                tbl.deletedAt.isNull() &
                tbl.startAt.isBetweenValues(startDate, endDate),
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
        var events = entry.value
            .map((row) => MeetEventView(
                meetEvent: row.readTable(db.meetEvent),
                discipline: row.readTable(db.discipline),
                category: row.readTable(db.category),
                athletesWithResults: {}))
            .toList();

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
              event.athletesWithResults[athlete] = athleteEvent.result ?? '';
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

  // Add methods to mutate the state
}

@riverpod
Stream<List<DisciplineView>> allDisciplines(Ref ref) async* {
  final db = ref.read(dbProvider);
  final query = (db.select(db.discipline)
        ..where(
          (tbl) => tbl.deletedAt.isNull(),
        ))
      .join(
    [
      leftOuterJoin(db.disciplineType,
          db.disciplineType.id.equalsExp(db.discipline.disciplineTypeId)),
    ],
  );

  yield* query.watch().map((rows) {
    return rows.map((row) {
      final discipline = row.readTable(db.discipline);
      final type = row.readTableOrNull(db.disciplineType);

      return DisciplineView(
        discipline: discipline,
        type: type,
      );
    }).toList();
  });
}

@riverpod
Stream<List<CategoryData>> allCategories(Ref ref) async* {
  final db = ref.read(dbProvider);
  yield* (db.select(db.category)
        ..where(
          (tbl) => tbl.deletedAt.isNull(),
        ))
      .watch();
}

@riverpod
class selectedMonthYearP extends _$selectedMonthYearP {
  @override
  MonthYearView build() {
    final now = DateTime.now();
    return MonthYearView(
      month: now.month,
      year: now.year,
    );
  }

  void nextMonth() {
    if (state.month == 12) {
      state = MonthYearView(
        month: 1,
        year: state.year + 1,
      );
    } else {
      state = MonthYearView(
        month: state.month + 1,
        year: state.year,
      );
    }
  }

  void previousMonth() {
    if (state.month == 1) {
      state = MonthYearView(
        month: 12,
        year: state.year - 1,
      );
    } else {
      state = MonthYearView(
        month: state.month - 1,
        year: state.year,
      );
    }
  }

  void setMonthAndYear(int month, int year) {
    state = MonthYearView(
      month: month,
      year: year,
    );
  }
}
