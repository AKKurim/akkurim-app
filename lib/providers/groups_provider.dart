import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/views/group_view.dart';
import '../models/views/simple_athlete_view.dart';
import '../models/views/trainer_view.dart';
import './trainer_provider.dart';
import './db_provider.dart';
import 'package:drift/drift.dart';

part 'groups_provider.g.dart';

@riverpod
class GroupsP extends _$GroupsP {
  @override
  Stream<List<GroupView>> build() async* {
    final db = ref.read(dbProvider);
    final currentTrainer = await ref.watch(currentTrainerProvider.future);

    final query = (db.select(db.group)
          ..where(
            (tbl) => tbl.deletedAt.isNull(),
          ))
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
      return rows.map((row) {
        final group = row.readTable(db.group);
        final groupTrainer = row.readTableOrNull(db.groupTrainer);
        final trainer = row.readTableOrNull(db.trainer);
        final trainerStatus = row.readTableOrNull(db.trainerStatus);
        final groupAthlete = row.readTableOrNull(db.groupAthlete);
        final athlete = row.readTableOrNull(db.athlete);
        final athleteStatus = row.readTableOrNull(db.athleteStatus);
        final club = row.readTableOrNull(db.club);
        final schoolYear = row.readTableOrNull(db.schoolYear);
        final trainingTime = row.readTableOrNull(db.trainingTime);

        return GroupView(
          group: group,
          trainers: [
            TrainerView(
              trainer: trainer!,
              trainerStatus: trainerStatus!,
              simpleAthlete: currentTrainer.simpleAthlete,
            ),
          ],
          athletes: [
            SimpleAthleteView(
              athlete: athlete!,
              athleteStatus: athleteStatus!,
              club: club,
            ),
          ],
          schoolYear: schoolYear,
          trainingTime: trainingTime,
        );
      }).toList();
    });
  }
}
