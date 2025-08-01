import 'package:ak_kurim_app/services/network/sync_service.dart';
import 'package:flutter/material.dart';
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
import 'package:collection/collection.dart';
import '../utils/utils.dart';
import '../services/database/companion_builder_map.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';

part 'meet_providers.g.dart';

@riverpod
class FullMeetProviderP extends _$FullMeetProviderP {
  @override
  Stream<FullMeetView> build(
      {required String meetId, FullMeetView? preloaded}) async* {
    // check if the stream is yielding a fullMeetView or null
    if (preloaded != null) {
      yield preloaded;
    }

    final db = ref.read(dbProvider);
    final List<SimpleAthleteView> athletes =
        await ref.watch(simpleAthletesPProvider.future);

    final query = (db.select(db.meet)
          ..where((tbl) => tbl.deletedAt.isNull() & tbl.id.equals(meetId))
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
      final meet = rows.first.readTable(db.meet);
      var events = rows.map((row) {
        final meetEv = row.readTableOrNull(db.meetEvent);
        return meetEv != null
            ? MeetEventView(
                meetEvent: meetEv,
                discipline: row.readTable(db.discipline),
                category: row.readTable(db.category),
                athletesWithResults: {})
            : null;
      }).toList();

      List<MeetEventView> events_ = [];
      for (final event in events) {
        if (event == null) {
          continue;
        }
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
      events.sort((a, b) {
        if (a!.meetEvent.startAt.isBefore(b!.meetEvent.startAt)) {
          return -1;
        } else if (a.meetEvent.startAt.isAfter(b.meetEvent.startAt)) {
          return 1;
        } else {
          return 0;
        }
      });

      final athleteMeetEvents = rows
          .map((row) {
            var athleteMeetEvent = row.readTableOrNull(db.athleteMeetEvent);
            if (athleteMeetEvent == null ||
                athleteMeetEvent.deletedAt != null) {
              return null;
            }
            return athleteMeetEvent;
          })
          .nonNulls
          .toList();

      final athletesInMeet = athletes
          .where((athlete) => athleteMeetEvents.any((event) =>
              event.athleteId == athlete.athlete.id &&
              events.any(
                  (meetEvent) => meetEvent?.meetEvent.id == event.meetEventId)))
          .toList();

      for (final event in events) {
        final athleteEvents = athleteMeetEvents
            .where((athleteEvent) =>
                athleteEvent.meetEventId == event?.meetEvent.id)
            .toList();

        for (final athlete in athletesInMeet) {
          final athleteEvent = athleteEvents.firstWhereOrNull(
              (athleteEvent) => athleteEvent.athleteId == athlete.athlete.id);

          if (athleteEvent != null) {
            event?.athletesWithResults[athlete] = ResultView(
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
        events: events.whereType<MeetEventView>().toList(),
      );
    });
  }

  Future<void> deleteMeetEvent(MeetEventData meet) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);

    var meetEventToDelete = Utils.convertMapKeysToSnakeCase(meet.toJson());
    meetEventToDelete['deleted_at'] = DateTime.now().toUtc().toIso8601String();
    meetEventToDelete['updated_at'] = DateTime.now().toUtc().toIso8601String();
    meetEventToDelete['created_at'] = meet.createdAt!.toUtc().toIso8601String();

    await db.into(db.meetEvent).insertOnConflictUpdate(
          buildMeetEventCompanion(meetEventToDelete),
        );

    await sync.addToSyncQueue(
      '/sync/meet_event',
      'post',
      json.encode({
        'data': [meetEventToDelete],
        'primary_keys': ['id'],
        'table': 'meet_event',
      }),
    );
  }

  Future<void> addMeetEvent({
    required String meetId,
    required int disciplineId,
    required int categoryId,
    required DateTime startAt,
    String? phase,
  }) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);

    final meeetEvent = await db.into(db.meetEvent).insertReturning(
        mode: InsertMode.insertOrReplace,
        MeetEventCompanion(
          id: Value(Uuid().v1()),
          meetId: Value(meetId),
          disciplineId: Value(disciplineId),
          categoryId: Value(categoryId),
          startAt: Value(startAt),
          phase: Value(phase),
          createdAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          deletedAt: const Value(null),
        ));

    await sync.addToSyncQueue(
      '/sync/meet_event',
      'post',
      json.encode({
        'data': [Utils.convertMapKeysToSnakeCase(meeetEvent.toJson())],
        'primary_keys': ['id'],
        'table': 'meet_event',
      }),
    );
  }
}

@riverpod
class MeetProvidersP extends _$MeetProvidersP {
  @override
  Stream<List<FullMeetView>> build({required DateTimeRange range}) async* {
    final db = ref.read(dbProvider);
    final DateTime startDate = range.start;
    final DateTime endDate = range.end;
    final List<SimpleAthleteView> athletes =
        await ref.watch(simpleAthletesPProvider.future);

    final query = (db.select(db.meet)
          ..where(
            (tbl) =>
                tbl.deletedAt.isNull() &
                (tbl.startAt.isBetweenValues(startDate, endDate) |
                    tbl.endAt.isBetweenValues(startDate, endDate)) &
                tbl.id.contains('CAS'),
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
        var events = entry.value.map((row) {
          final meetEv = row.readTableOrNull(db.meetEvent);
          return meetEv != null
              ? MeetEventView(
                  meetEvent: meetEv,
                  discipline: row.readTable(db.discipline),
                  category: row.readTable(db.category),
                  athletesWithResults: {})
              : null;
        }).toList();

        List<MeetEventView> events_ = [];
        for (final event in events) {
          if (event == null) {
            continue;
          }
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
        events.sort((a, b) {
          if (a!.meetEvent.startAt.isBefore(b!.meetEvent.startAt)) {
            return -1;
          } else if (a.meetEvent.startAt.isAfter(b.meetEvent.startAt)) {
            return 1;
          } else {
            return 0;
          }
        });

        final athleteMeetEvents = entry.value
            .map((row) {
              var athleteMeetEvent = row.readTableOrNull(db.athleteMeetEvent);
              if (athleteMeetEvent == null ||
                  athleteMeetEvent.deletedAt != null) {
                return null;
              }
              return athleteMeetEvent;
            })
            .nonNulls
            .toList();

        final athletesInMeet = athletes
            .where((athlete) => athleteMeetEvents.any((event) =>
                event.athleteId == athlete.athlete.id &&
                events.any((meetEvent) =>
                    meetEvent?.meetEvent.id == event.meetEventId)))
            .toList();

        for (final event in events) {
          final athleteEvents = athleteMeetEvents
              .where((athleteEvent) =>
                  athleteEvent.meetEventId == event?.meetEvent.id)
              .toList();

          for (final athlete in athletesInMeet) {
            final athleteEvent = athleteEvents.firstWhereOrNull(
                (athleteEvent) => athleteEvent.athleteId == athlete.athlete.id);

            if (athleteEvent != null) {
              event?.athletesWithResults[athlete] = ResultView(
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
          events: events.whereType<MeetEventView>().toList(),
        );
      }).toList();
    });
  }

  Future<void> deleteMeetEvent(MeetEventData meet) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);

    var meetEventToDelete = Utils.convertMapKeysToSnakeCase(meet.toJson());
    meetEventToDelete['deleted_at'] = DateTime.now().toUtc().toIso8601String();
    meetEventToDelete['updated_at'] = DateTime.now().toUtc().toIso8601String();
    meetEventToDelete['created_at'] = meet.createdAt!.toUtc().toIso8601String();

    await db.into(db.meetEvent).insertOnConflictUpdate(
          buildMeetEventCompanion(meetEventToDelete),
        );

    await sync.addToSyncQueue(
      '/sync/meet_event',
      'post',
      json.encode({
        'data': [meetEventToDelete],
        'primary_keys': ['id'],
        'table': 'meet_event',
      }),
    );
  }

  Future<void> addMeetEvent({
    required String meetId,
    required int disciplineId,
    required int categoryId,
    required DateTime startAt,
    String? phase,
  }) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);

    final meeetEvent = await db.into(db.meetEvent).insertReturning(
        mode: InsertMode.insertOrReplace,
        MeetEventCompanion(
          id: Value(Uuid().v1()),
          meetId: Value(meetId),
          disciplineId: Value(disciplineId),
          categoryId: Value(categoryId),
          startAt: Value(startAt),
          phase: Value(phase),
          createdAt: Value(DateTime.now().toUtc()),
          updatedAt: Value(DateTime.now().toUtc()),
          deletedAt: const Value(null),
        ));

    await sync.addToSyncQueue(
      '/sync/meet_event',
      'post',
      json.encode({
        'data': [Utils.convertMapKeysToSnakeCase(meeetEvent.toJson())],
        'primary_keys': ['id'],
        'table': 'meet_event',
      }),
    );
  }
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
class SelectedMonthYearP extends _$SelectedMonthYearP {
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
