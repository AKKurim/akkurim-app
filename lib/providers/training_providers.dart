import 'package:ak_kurim_app/services/database/companion_builder_map.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../services/database/drift_database.dart';
import './db_provider.dart';
import '../models/views/training_view.dart';
import 'package:drift/drift.dart';
import '../models/views/group_view.dart';
import './groups_provider.dart';
import './simple_athletes_provider.dart';
import './trainer_provider.dart';
import '../models/views/simple_athlete_view.dart';
import '../models/views/trainer_view.dart';
import 'package:collection/collection.dart';
import '../utils/utils.dart';
import 'package:uuid/uuid.dart';
import '../services/network/sync_service.dart';
import '../services/auth/auth_service.dart';
import 'dart:convert';

part 'training_providers.g.dart';

@riverpod
class TrainingsP extends _$TrainingsP {
  @override
  Stream<List<TrainingView>> build({required DateTimeRange range}) async* {
    final db = ref.read(dbProvider);

    final groups = await ref.watch(groupsPProvider.future);
    final athletes = await ref.watch(simpleAthletesPProvider.future);
    final trainers = await ref.watch(trainerPProvider.future);
    final groupIds = groups.map((g) => g.group.id).toList();

    final query = (db.select(db.training)
          ..where((t) => t.groupId.isIn(groupIds))
          ..where((t) => t.startAt.isBetweenValues(range.start, range.end))
          ..where((t) => t.deletedAt.isNull())
          ..orderBy([
            (tbl) => OrderingTerm(
                  expression: tbl.startAt,
                  mode: OrderingMode.asc,
                ),
          ]))
        .join([
      leftOuterJoin(
        db.trainingAthlete,
        db.trainingAthlete.trainingId.equalsExp(db.training.id),
      ),
      leftOuterJoin(
        db.trainingTrainer,
        db.trainingTrainer.trainingId.equalsExp(db.training.id),
      ),
    ]);

    yield* query.watch().map((rows) {
      final grouped = groupBy(
        rows,
        (row) => row.readTable(db.training).id,
      );
      final trainingViews = grouped.entries.map((entry) {
        final training = entry.value.first.readTable(db.training);
        final group = groups.firstWhere(
          (g) => g.group.id == training.groupId,
          orElse: () => throw Exception(
              'Group ${training.groupId} not found in groups list'),
        );
        final athleteAttendance = <SimpleAthleteView, String>{};
        final trainerAttendance = <TrainerView, String>{};

        for (final row in entry.value) {
          final athleteId = row.readTableOrNull(db.trainingAthlete)?.athleteId;
          final trainerId = row.readTableOrNull(db.trainingTrainer)?.trainerId;

          if (athleteId != null) {
            final athlete = athletes.firstWhere(
                (a) => a.athlete.id == athleteId,
                orElse: () => throw Exception(
                    'Athlete with ID $athleteId not found in athletes list'));
            athleteAttendance[athlete] =
                row.readTableOrNull(db.trainingAthlete)?.presence ?? '';
          }

          if (trainerId != null) {
            final trainer = trainers.firstWhere(
                (t) => t.trainer.id == trainerId,
                orElse: () => throw Exception(
                    'Trainer with ID $trainerId not found in trainers list'));
            trainerAttendance[trainer] =
                row.readTableOrNull(db.trainingTrainer)?.presence ?? '';
          }
        }
        return TrainingView(
          training: training,
          group: group,
          athleteAttendance: athleteAttendance,
          trainerAttendance: trainerAttendance,
        );
      }).toList();
      return trainingViews;
    });
  }

  Future<void> createTrainings(
      GroupView group, DateTime from, DateTime to, int trainingDuration) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    final auth = ref.read(authServiceProvider);
    final groupId = group.group.id;

    // Create a list of dates between from and to
    final dates = <DateTime>[];
    final int weekday =
        TimeHelper.getWeekDayFromString(group.trainingTime!.day);
    DateTime currentDate = from;
    while (currentDate.isBefore(to) || currentDate.isAtSameMomentAs(to)) {
      if (currentDate.weekday == weekday) {
        TimeHelper time = TimeHelper.fromString(group.trainingTime!.summerTime);
        dates.add(currentDate.copyWith(
            hour: time.hour,
            minute: time.minute,
            second: 0,
            millisecond: 0,
            microsecond: 0));
      }
      currentDate = currentDate.add(const Duration(days: 1));
    }

    // Insert each date into the database
    List<TrainingData> trainingData = [];
    for (final date in dates) {
      TrainingData training = await db.into(db.training).insertReturning(
            TrainingCompanion(
              id: Value(Uuid().v1()),
              groupId: Value(groupId),
              startAt: Value(date),
              description:
                  Value(''), // description is set when taking attendance
              durationMinutes: Value(trainingDuration),
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
              deletedAt: Value(null),
              lastUpdatedBy: Value(auth.asData!.value.email),
            ),
          );
      trainingData.add(training);
    }

    await sync.addToSyncQueue(
      '/sync/training',
      'post',
      json.encode(
        {
          'data': trainingData
              .map(
                (training) => Utils.convertMapKeysToSnakeCase(
                  training.toJson(),
                ),
              )
              .toList(),
          'primary_keys': ['id'],
          'table': 'training',
        },
      ),
    );
  }

  Future<void> deleteTraining(TrainingView training) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    final auth = ref.read(authServiceProvider);
    var trainingToDelete = Utils.convertMapKeysToSnakeCase(
      training.training.toJson(),
    );
    trainingToDelete['deleted_at'] = DateTime.now().toUtc().toIso8601String();
    trainingToDelete['updated_at'] = DateTime.now().toUtc().toIso8601String();
    trainingToDelete['created_at'] =
        training.training.createdAt.toUtc().toIso8601String();
    trainingToDelete['start_at'] =
        training.training.startAt.toUtc().toIso8601String();
    trainingToDelete['last_updated_by'] = auth.asData!.value.email;

    await db.into(db.training).insertOnConflictUpdate(
          buildTrainingCompanion(trainingToDelete),
        );

    await sync.addToSyncQueue(
      '/sync/training',
      'post',
      json.encode(
        {
          'data': [trainingToDelete],
          'primary_keys': ['id'],
          'table': 'training',
        },
      ),
    );
  }

  Future<void> saveAttendance(
    TrainingView training,
    Map<SimpleAthleteView, String> athleteAttendance,
    Map<TrainerView, String> trainerAttendance,
    String? note,
  ) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    final auth = ref.read(authServiceProvider);

    if (note != null) {
      final updatedTraining = await db.into(db.training).insertReturning(
            mode: InsertMode.insertOrReplace,
            TrainingCompanion(
              id: Value(training.training.id),
              startAt: Value(training.training.startAt),
              groupId: Value(training.training.groupId),
              durationMinutes: Value(training.training.durationMinutes),
              description: Value(note),
              createdAt: Value(training.training.createdAt),
              updatedAt: Value(DateTime.now()),
              deletedAt: Value(null),
              lastUpdatedBy: Value(auth.asData!.value.email),
            ),
          );
      await sync.addToSyncQueue(
        '/sync/training',
        'post',
        json.encode(
          {
            'data': [
              Utils.convertMapKeysToSnakeCase(
                updatedTraining.toJson(),
              )
            ],
            'primary_keys': ['id'],
            'table': 'training',
          },
        ),
      );
    }

    List<TrainingTrainerData> trainingTrainerData = [];
    for (final trainer in trainerAttendance.keys) {
      final trainerId = trainer.trainer.id;
      final presence = trainerAttendance[trainer] ?? '';
      TrainingTrainerData trainingTrainer =
          await db.into(db.trainingTrainer).insertReturning(
                mode: InsertMode.insertOrReplace,
                TrainingTrainerCompanion(
                  trainingId: Value(training.training.id),
                  trainerId: Value(trainerId),
                  presence: Value(presence),
                  createdAt: Value(DateTime.now().toUtc()),
                  updatedAt: Value(DateTime.now().toUtc()),
                  deletedAt: Value(null),
                  lastUpdatedBy: Value(auth.asData!.value.email),
                ),
              );
      trainingTrainerData.add(trainingTrainer);
    }

    await sync.addToSyncQueue(
      '/sync/training_trainer',
      'post',
      json.encode(
        {
          'data': trainingTrainerData
              .map(
                (trainingTrainer) => Utils.convertMapKeysToSnakeCase(
                  trainingTrainer.toJson(),
                ),
              )
              .toList(),
          'primary_keys': ['training_id', 'trainer_id'],
          'table': 'training_trainer',
        },
      ),
    );

    List<TrainingAthleteData> trainingAthleteData = [];
    for (final athlete in athleteAttendance.keys) {
      final athleteId = athlete.athlete.id;
      final presence = athleteAttendance[athlete] ?? '';
      TrainingAthleteData trainingAthlete =
          await db.into(db.trainingAthlete).insertReturning(
                mode: InsertMode.insertOrReplace,
                TrainingAthleteCompanion(
                  trainingId: Value(training.training.id),
                  athleteId: Value(athleteId),
                  presence: Value(presence),
                  createdAt: Value(DateTime.now().toUtc()),
                  updatedAt: Value(DateTime.now().toUtc()),
                  deletedAt: Value(null),
                  lastUpdatedBy: Value(auth.asData!.value.email),
                ),
              );
      trainingAthleteData.add(trainingAthlete);
    }

    await sync.addToSyncQueue(
      '/sync/training_athlete',
      'post',
      json.encode(
        {
          'data': trainingAthleteData
              .map(
                (trainingAthlete) => Utils.convertMapKeysToSnakeCase(
                  trainingAthlete.toJson(),
                ),
              )
              .toList(),
          'primary_keys': ['training_id', 'athlete_id'],
          'table': 'training_athlete',
        },
      ),
    );
  }
}

@riverpod
Stream<List<SchoolYearData>> schoolYears(Ref ref) async* {
  final db = ref.read(dbProvider);
  yield* db.select(db.schoolYear).watch();
}

@riverpod
Stream<List<TrainingTimeData>> trainingTimes(Ref ref) async* {
  final db = ref.read(dbProvider);
  yield* db.select(db.trainingTime).watch();
}

@riverpod
Stream<TrainingView> training(Ref ref, String trainingId) async* {
  final db = ref.read(dbProvider);

  final groups = await ref.watch(groupsPProvider.future);
  final athletes = await ref.watch(simpleAthletesPProvider.future);
  final trainers = await ref.watch(trainerPProvider.future);
  final groupIds = groups.map((g) => g.group.id).toList();

  final query = (db.select(db.training)
        ..where((t) => t.groupId.isIn(groupIds))
        ..where((t) => t.id.equals(trainingId))
        ..where((t) => t.deletedAt.isNull())
        ..orderBy([
          (tbl) => OrderingTerm(
                expression: tbl.startAt,
                mode: OrderingMode.asc,
              ),
        ]))
      .join([
    leftOuterJoin(
      db.trainingAthlete,
      db.trainingAthlete.trainingId.equalsExp(db.training.id),
    ),
    leftOuterJoin(
      db.trainingTrainer,
      db.trainingTrainer.trainingId.equalsExp(db.training.id),
    ),
  ]);

  yield* query.watch().map((rows) {
    final training = rows.first.readTable(db.training);
    final group = groups.firstWhere(
      (g) => g.group.id == training.groupId,
      orElse: () =>
          throw Exception('Group ${training.groupId} not found in groups list'),
    );
    final athleteAttendance = <SimpleAthleteView, String>{};
    final trainerAttendance = <TrainerView, String>{};

    for (final row in rows) {
      final athleteId = row.readTableOrNull(db.trainingAthlete)?.athleteId;
      final trainerId = row.readTableOrNull(db.trainingTrainer)?.trainerId;

      if (athleteId != null) {
        final athlete = athletes.firstWhere((a) => a.athlete.id == athleteId,
            orElse: () => throw Exception(
                'Athlete with ID $athleteId not found in athletes list'));
        athleteAttendance[athlete] =
            row.readTableOrNull(db.trainingAthlete)?.presence ?? '';
      }

      if (trainerId != null) {
        final trainer = trainers.firstWhere((t) => t.trainer.id == trainerId,
            orElse: () => throw Exception(
                'Trainer with ID $trainerId not found in trainers list'));
        trainerAttendance[trainer] =
            row.readTableOrNull(db.trainingTrainer)?.presence ?? '';
      }
    }
    return TrainingView(
      training: training,
      group: group,
      athleteAttendance: athleteAttendance,
      trainerAttendance: trainerAttendance,
    );
  });
}
