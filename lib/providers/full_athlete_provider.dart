import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/views/full_athlete_view.dart';
import './db_provider.dart';
import '../services/database/drift_database.dart';
import 'package:drift/drift.dart';

part 'full_athlete_provider.g.dart';

@riverpod
class FullAthleteP extends _$FullAthleteP {
  @override
  Stream<FullAthleteView> build(String athleteId) async* {
    final db = ref.read(dbProvider);
    final query = (db.select(db.athlete)
          ..where(
            (tbl) => tbl.deletedAt.isNull() & tbl.id.equals(athleteId),
          ))
        .join([
      leftOuterJoin(db.athleteStatus,
          db.athleteStatus.id.equalsExp(db.athlete.athleteStatusId)),
      leftOuterJoin(db.club, db.club.id.equalsExp(db.athlete.clubId)),
      leftOuterJoin(db.athleteGuardian,
          db.athleteGuardian.athleteId.equalsExp(db.athlete.id)),
      leftOuterJoin(
          db.guardian, db.guardian.id.equalsExp(db.athleteGuardian.guardianId)),
      leftOuterJoin(db.athleteMeetEvent,
          db.athleteMeetEvent.athleteId.equalsExp(db.athlete.id)),
      leftOuterJoin(db.athleteSignUpForm,
          db.athleteSignUpForm.athleteId.equalsExp(db.athlete.id)),
      leftOuterJoin(db.signUpForm,
          db.signUpForm.id.equalsExp(db.athleteSignUpForm.signUpFormId)),
    ]);

    yield* query.watch().map((rows) {
      final athlete = rows.first.readTable(db.athlete);
      final athleteStatus = rows.first.readTable(db.athleteStatus);
      final club = rows.first.readTableOrNull(db.club);
      final guardians = rows
          .map((row) => row.readTableOrNull(db.guardian))
          .whereType<GuardianData>()
          .toList();
      final results = rows
          .map((row) => row.readTableOrNull(db.athleteMeetEvent))
          .whereType<AthleteMeetEventData>()
          .toList();
      final signUpForms = rows
          .map((row) => row.readTableOrNull(db.athleteSignUpForm))
          .whereType<AthleteSignUpFormData>()
          .toList();
      return FullAthleteView(
        athlete: athlete,
        athleteStatus: athleteStatus,
        club: club,
        guardians: guardians,
        results: results,
        signUpForms: signUpForms,
      );
    });
  }

  Future<void> updateAthleteStatus(String athleteId, String statusId) async {
    final db = ref.read(dbProvider);
    print('Updating athlete status to $statusId for athlete $athleteId');
    await (db.update(db.athlete)..where((tbl) => tbl.id.equals(athleteId)))
        .write(AthleteCompanion(
      athleteStatusId: Value(statusId),
    ));
    // TODO add to sync queue
  }
}
