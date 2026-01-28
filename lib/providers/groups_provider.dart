import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/views/group_view.dart';
import '../models/views/simple_athlete_view.dart';
import '../models/views/trainer_view.dart';
import './trainer_provider.dart';
import './db_provider.dart';
import 'package:drift/drift.dart';
import '../utils/utils.dart';
import './training_providers.dart';
import '../services/database/drift_database.dart';
import 'package:uuid/uuid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';
import '../services/database/companion_builder_map.dart';
import '../services/network/sync_service.dart';
import '../services/auth/auth_service.dart';

part 'groups_provider.g.dart';

@riverpod
class GroupsP extends _$GroupsP {
  @override
  Stream<List<GroupView>> build() async* {
    final db = ref.read(dbProvider);
    //final currentTrainer = await ref.watch(currentTrainerProvider.future);
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
        leftOuterJoin(
            db.groupAthlete, db.groupAthlete.groupId.equalsExp(db.group.id)),
        leftOuterJoin(
            db.athlete, db.athlete.id.equalsExp(db.groupAthlete.athleteId)),
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
              final simpleAthlete = allTrainers.firstWhereOrNull(
                (trainer_) => trainer_.trainer.athleteId == trainer!.athleteId,
              );
              return (trainer != null)
                  ? TrainerView(
                      trainer: trainer,
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
              final club = row.readTableOrNull(db.club);
              return (athlete != null)
                  ? SimpleAthleteView(
                      athlete: athlete,
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
    required TimeHelper summerTime,
    required TimeHelper winterTime,
    required SchoolYearData schoolYear,
    required List<TrainerView> trainers,
    required List<SimpleAthleteView> athletes,
    required int durationSummer,
    required int durationWinter,
    String? trainingTimeId,
    String? groupId,
    List<String>? previousAthletesIds,
    List<String>? previousTrainersIds,
  }) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    final auth = ref.read(authServiceProvider);

    if (trainingTimeId == null) {
      trainingTimeId = Uuid().v1();
      final trainingTime = await db.into(db.trainingTime).insertReturning(
            mode: InsertMode.insertOrReplace,
            TrainingTimeCompanion(
              id: Value(trainingTimeId),
              day: Value(day),
              summerTime: Value(summerTime.toString()),
              winterTime: Value(winterTime.toString()),
              durationSummer: Value(durationSummer),
              durationWinter: Value(durationWinter),
              createdAt: Value(DateTime.now()),
              updatedAt: Value(DateTime.now()),
              lastUpdatedBy: Value(auth.asData!.value.email),
            ),
          );
      await sync.addToSyncQueue(
        '/sync/training_time',
        'post',
        json.encode({
          'data': [Utils.convertMapKeysToSnakeCase(trainingTime.toJson())],
          'primary_keys': ['id'],
          'table': 'training_time',
        }),
      );
    }

    groupId ??= Uuid().v1();
    final newGroup = await db.into(db.group).insertReturning(
          mode: InsertMode.insertOrReplace,
          GroupCompanion(
            id: Value(groupId),
            name: Value(name),
            description: Value(''),
            schoolYearId: Value(schoolYear.id),
            trainingTimeId: Value(trainingTimeId),
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
            deletedAt: Value(null),
            lastUpdatedBy: Value(auth.asData!.value.email),
            system: Value(0),
          ),
        );
    await sync.addToSyncQueue(
      '/sync/group',
      'post',
      json.encode({
        'data': [Utils.convertMapKeysToSnakeCase(newGroup.toJson())],
        'primary_keys': ['id'],
        'table': 'group',
      }),
    );

    List<GroupTrainerData> updatedGroupTrainer = [];
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
      updatedGroupTrainer.add(groupTrainer);
    }

    for (final trainerId in previousTrainersIds ?? []) {
      if (!trainers.map((trainer) => trainer.trainer.id).contains(trainerId)) {
        final deletedTrainer = await db.into(db.groupTrainer).insertReturning(
              mode: InsertMode.insertOrReplace,
              GroupTrainerData(
                  groupId: newGroup.id,
                  trainerId: trainerId,
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                  deletedAt: DateTime.now().toUtc(),
                  lastUpdatedBy: auth.asData!.value.email),
            );
        updatedGroupTrainer.add(deletedTrainer);
      }
    }

    await sync.addToSyncQueue(
      '/sync/group_trainer',
      'post',
      json.encode(
        {
          'data': updatedGroupTrainer
              .map((trainer) =>
                  Utils.convertMapKeysToSnakeCase(trainer.toJson()))
              .toList(),
          'primary_keys': ['group_id', 'trainer_id'],
          'table': 'group_trainer',
        },
      ),
    );

    List<GroupAthleteData> updatedGroupAthlete = [];
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
      updatedGroupAthlete.add(groupAthlete);
    }

    for (final athleteId in previousAthletesIds ?? []) {
      if (!athletes.map((athlete) => athlete.athlete.id).contains(athleteId)) {
        final deletedGroupAthlete =
            await db.into(db.groupAthlete).insertReturning(
                  mode: InsertMode.insertOrReplace,
                  GroupAthleteData(
                      groupId: newGroup.id,
                      athleteId: athleteId,
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now(),
                      deletedAt: DateTime.now(),
                      lastUpdatedBy: auth.asData!.value.email),
                );
        updatedGroupAthlete.add(deletedGroupAthlete);
      }
    }

    await sync.addToSyncQueue(
      '/sync/group_athlete',
      'post',
      json.encode({
        'data': updatedGroupAthlete
            .map((athlete) => Utils.convertMapKeysToSnakeCase(athlete.toJson()))
            .toList(),
        'primary_keys': ['group_id', 'athlete_id'],
        'table': 'group_athlete',
      }),
    );
  }

  Future<void> deleteGroup(GroupView group) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    var groupToDelete = Utils.convertMapKeysToSnakeCase(group.group.toJson());
    groupToDelete['deleted_at'] = DateTime.now().toUtc().toIso8601String();
    groupToDelete['updated_at'] = DateTime.now().toUtc().toIso8601String();
    groupToDelete['created_at'] =
        group.group.createdAt.toUtc().toIso8601String();
    groupToDelete['last_updated_by'] =
        ref.read(authServiceProvider).asData!.value.email;

    await db.into(db.group).insertOnConflictUpdate(
          buildGroupCompanion(groupToDelete),
        );

    await sync.addToSyncQueue(
      '/sync/group',
      'post',
      json.encode({
        'data': [groupToDelete],
        'primary_keys': ['id'],
        'table': 'group_athlete',
      }),
    );
  }
}

@riverpod
Stream<List<GroupData>> allGroupData(Ref ref) async* {
  final db = ref.read(dbProvider);
  yield* db.select(db.group).watch();
}

@riverpod
Stream<GroupView> group(Ref ref, String groupId) async* {
  final groups = await ref.read(groupsPProvider.future);
  yield groups.where((group) => group.group.id == groupId).first;
}
