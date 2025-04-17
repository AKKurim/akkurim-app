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
import 'dart:convert';

part 'training_providers.g.dart';

@riverpod
class TrainingsP extends _$TrainingsP {
  @override
  Stream<List<TrainingView>> build() async* {
    final db = ref.read(dbProvider);
    final groups = await ref.watch(groupsPProvider.future);
    final athletes = await ref.watch(simpleAthletesPProvider.future);
    final trainers = await ref.watch(trainerPProvider.future);
    final groupIds = groups.map((g) => g.group.id).toList();
    final DateTime from = DateTime.now().subtract(const Duration(days: 1));
    final DateTime to = DateTime.now().add(const Duration(days: 30));

    final query = (db.select(db.training)
          ..where((t) => t.groupId.isIn(groupIds))
          ..where((t) => t.datetime.isBetweenValues(from, to))
          ..orderBy([
            (tbl) => OrderingTerm(
                  expression: tbl.datetime,
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

      return grouped.entries.map((entry) {
        final training = entry.value.first.readTable(db.training);
        final group = groups.firstWhere((g) => g.group.id == training.groupId);
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
    });
  }

  Future<void> createTrainings(
      GroupView group, DateTime from, DateTime to, int trainingDuration) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
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
              datetime: Value(date),
              description:
                  Value(''), // TODO: Add description in the edit screen
              durationMinutes: Value(trainingDuration),
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
              deletedAt: Value(null),
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
