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
        // ..where(
        //   (tbl) => tbl.schoolYearId.equals(currentSchoolYear.id),
        // )
        )
        .join(
      [
        innerJoin(
          db.groupTrainer,
          db.groupTrainer.trainerId.equalsExp(
            Variable<String>(currentTrainer.trainer.id),
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
    );

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
              return (trainer != null && status != null)
                  ? TrainerView(
                      trainer: trainer,
                      trainerStatus: status,
                      simpleAthlete: currentTrainer.simpleAthlete,
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
  }) async {
    final db = ref.read(dbProvider);
    if (trainingTimeId == null) {
      trainingTimeId = Uuid().v1();
      final training_time = await db.into(db.trainingTime).insertReturning(
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
    final group = await db.into(db.group).insertReturning(
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
            GroupTrainerCompanion(
              groupId: Value(group.id),
              trainerId: Value(trainer.trainer.id),
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
            ),
          );
    }

    for (final athlete in athletes) {
      final groupAthlete = await db.into(db.groupAthlete).insertReturning(
            GroupAthleteCompanion(
              groupId: Value(group.id),
              athleteId: Value(athlete.athlete.id),
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
            ),
          );
    }
    print('Group saved: ${group.id}');
    // TODO add to sync queue
  }
}

@riverpod
Stream<List<GroupData>> allGroupData(Ref ref) async* {
  final db = ref.read(dbProvider);
  yield* db.select(db.group).watch();
}
