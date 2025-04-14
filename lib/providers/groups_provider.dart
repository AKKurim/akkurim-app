import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/views/group_view.dart';
import '../models/views/simple_athlete_view.dart';
import '../models/views/trainer_view.dart';
import './trainer_provider.dart';
import './db_provider.dart';
import 'package:drift/drift.dart';
import '../utils/utils.dart';
import './training_providers.dart';
import 'package:flutter/material.dart';
import '../services/database/drift_database.dart';
import 'package:uuid/uuid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';
import '../services/database/companion_builder_map.dart';
import '../providers/trainer_provider.dart';

part 'groups_provider.g.dart';

@riverpod
class GroupsP extends _$GroupsP {
  @override
  Stream<List<GroupView>> build() async* {
    final db = ref.read(dbProvider);
    final currentTrainer = await ref.watch(currentTrainerProvider.future);
    final schoolYears = await ref.watch(schoolYearsProvider.future);
    final currentSchoolYear = schoolYears.firstWhere(
      (year) => year.name == Utils.getCurrentSchoolYearString(),
      orElse: () => throw Exception('No current school year found'),
    );
    final query = (db.select(db.group)
          ..where(
            (tbl) => tbl.deletedAt.isNull(),
          )
          ..where(
            (tbl) => tbl.schoolYearId.equals(currentSchoolYear.id),
          ))
        .join(
      [
        leftOuterJoin(
          db.groupTrainer,
          db.groupTrainer.groupId.equalsExp(
            db.group.id,
          ),
        ),
        leftOuterJoin(
            db.trainer, db.groupTrainer.trainerId.equalsExp(db.trainer.id)),
        leftOuterJoin(db.trainerStatus,
            db.trainerStatus.id.equalsExp(db.trainer.trainerStatusId)),
        leftOuterJoin(
            db.groupAthlete, db.groupAthlete.groupId.equalsExp(db.group.id)),
        leftOuterJoin(
            db.athlete, db.athlete.id.equalsExp(db.groupAthlete.athleteId)),
        leftOuterJoin(db.athleteStatus,
            db.athleteStatus.id.equalsExp(db.athlete.athleteStatusId)),
        leftOuterJoin(db.club, db.club.id.equalsExp(db.athlete.clubId)),
        leftOuterJoin(
            db.schoolYear, db.schoolYear.id.equalsExp(db.group.schoolYearId)),
        leftOuterJoin(db.trainingTime,
            db.trainingTime.id.equalsExp(db.group.trainingTimeId)),
      ],
    )..where(db.groupTrainer.deletedAt.isNull() &
        db.groupAthlete.deletedAt.isNull());

    final allTrainers = await ref.watch(trainerPProvider.future);

    yield* query.watch().map((rows) {
      final grouped = groupBy(rows, (row) {
        return row.readTable(db.group).id;
      });

      final groupViews = grouped.entries.map((entry) {
        final rows = entry.value;
        final group = rows.first.readTable(db.group);
        final schoolYear = rows.first.readTableOrNull(db.schoolYear);
        final trainingTime = rows.first.readTableOrNull(db.trainingTime);

        final trainers = rows
            .map((row) {
              final trainer = row.readTableOrNull(db.trainer);
              final status = row.readTableOrNull(db.trainerStatus);
              final simpleAthlete = allTrainers.firstWhereOrNull(
                (trainer_) => trainer_.trainer.athleteId == trainer!.athleteId,
              );
              return (trainer != null && status != null)
                  ? TrainerView(
                      trainer: trainer,
                      trainerStatus: status,
                      simpleAthlete: simpleAthlete!.simpleAthlete,
                    )
                  : null;
            })
            .whereType<TrainerView>()
            .toSet()
            .toList();

        final athletes = rows
            .map((row) {
              final athlete = row.readTableOrNull(db.athlete);
              final status = row.readTableOrNull(db.athleteStatus);
              final club = row.readTableOrNull(db.club);
              return (athlete != null && status != null)
                  ? SimpleAthleteView(
                      athlete: athlete,
                      athleteStatus: status,
                      club: club,
                    )
                  : null;
            })
            .whereType<SimpleAthleteView>()
            .toSet()
            .toList();

        return GroupView(
          group: group,
          trainers: trainers,
          athletes: athletes,
          schoolYear: schoolYear,
          trainingTime: trainingTime,
        );
      }).toList();
      return groupViews;
    });
  }

  Future<void> saveGroup({
    required String name,
    required String day,
    required TimeOfDay startTime,
    required SchoolYearData schoolYear,
    required List<TrainerView> trainers,
    required List<SimpleAthleteView> athletes,
    String? trainingTimeId,
    String? groupId,
    List<String>? previousAthletesIds,
    List<String>? previousTrainersIds,
  }) async {
    final db = ref.read(dbProvider);
    if (trainingTimeId == null) {
      trainingTimeId = Uuid().v1();
      final training_time = await db.into(db.trainingTime).insertReturning(
            mode: InsertMode.insertOrReplace,
            TrainingTimeCompanion(
              id: Value(trainingTimeId),
              day: Value(day),
              summerTime: Value('${startTime.hour}:${startTime.minute}+0000'),
              winterTime: Value(
                '${startTime.hour + 1}:${startTime.minute}+0000', // TODO get offset
              ),
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
            ),
          );
    }

    groupId ??= Uuid().v1();
    final newGroup = await db.into(db.group).insertReturning(
          mode: InsertMode.insertOrReplace,
          GroupCompanion(
            id: Value(groupId),
            name: Value(name),
            schoolYearId: Value(schoolYear.id),
            trainingTimeId: Value(trainingTimeId),
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
            deletedAt: Value(null),
          ),
        );

    for (final trainer in trainers) {
      final groupTrainer = await db.into(db.groupTrainer).insertReturning(
            mode: InsertMode.insertOrReplace,
            GroupTrainerCompanion(
              groupId: Value(newGroup.id),
              trainerId: Value(trainer.trainer.id),
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
              deletedAt: Value(null),
            ),
          );
      print('Group trainer saved: ${groupTrainer.trainerId}');
    }

    for (final trainerId in previousTrainersIds ?? []) {
      if (!trainers.map((trainer) => trainer.trainer.id).contains(trainerId)) {
        await db.into(db.groupTrainer).insertReturning(
              mode: InsertMode.insertOrReplace,
              GroupTrainerData(
                  groupId: newGroup.id,
                  trainerId: trainerId,
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                  deletedAt: DateTime.now().toUtc()),
            );
      }
    }

    for (final athlete in athletes) {
      final groupAthlete = await db.into(db.groupAthlete).insertReturning(
            mode: InsertMode.insertOrReplace,
            GroupAthleteCompanion(
              groupId: Value(newGroup.id),
              athleteId: Value(athlete.athlete.id),
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
              deletedAt: Value(null),
            ),
          );
    }

    for (final athleteId in previousAthletesIds ?? []) {
      if (!athletes.map((athlete) => athlete.athlete.id).contains(athleteId)) {
        await db.into(db.groupAthlete).insertReturning(
              mode: InsertMode.insertOrReplace,
              GroupAthleteData(
                groupId: newGroup.id,
                athleteId: athleteId,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                deletedAt: DateTime.now(),
              ),
            );
      }
    }

    print('Group saved: ${newGroup.id}');
    // TODO add to sync queue
  }

  Future<void> deleteGroup(GroupView group) async {
    final db = ref.read(dbProvider);
    var groupToDelete = Utils.convertMapKeysToSnakeCase(group.group.toJson());
    groupToDelete['deleted_at'] = DateTime.now().toUtc().toIso8601String();
    groupToDelete['updated_at'] = DateTime.now().toUtc().toIso8601String();
    groupToDelete['created_at'] =
        group.group.createdAt.toUtc().toIso8601String();
    await db
        .into(db.group)
        .insertOnConflictUpdate(buildGroupCompanion(groupToDelete));
  }
}

@riverpod
Stream<List<GroupData>> allGroupData(Ref ref) async* {
  final db = ref.read(dbProvider);
  yield* db.select(db.group).watch();
}
