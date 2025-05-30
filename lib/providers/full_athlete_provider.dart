import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/views/full_athlete_view.dart';
import './db_provider.dart';
import '../services/database/drift_database.dart';
import '../services/network/sync_service.dart';
import 'dart:convert';
import 'package:drift/drift.dart';
import '../utils/utils.dart';
import '../services/auth/auth_service.dart';
import '../models/views/result_view.dart';

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
      leftOuterJoin(db.meetEvent,
          db.meetEvent.id.equalsExp(db.athleteMeetEvent.meetEventId)),
      leftOuterJoin(
          db.discipline, db.discipline.id.equalsExp(db.meetEvent.disciplineId)),
      leftOuterJoin(db.meet, db.meet.id.equalsExp(db.meetEvent.meetId)),
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
          .toList()
          .toSet()
          .toList();
      final athleteMeetEvents = rows
          .map((row) => row.readTableOrNull(db.athleteMeetEvent))
          .whereType<AthleteMeetEventData>()
          .toList();
      final signUpForms = rows
          .map((row) => row.readTableOrNull(db.athleteSignUpForm))
          .whereType<AthleteSignUpFormData>()
          .toList();
      List<ResultView> results = [];
      for (var athleteMeetEvent in athleteMeetEvents) {
        final discipline = rows
            .firstWhere(
              (row) =>
                  row.readTable(db.meetEvent).id ==
                  athleteMeetEvent.meetEventId,
              orElse: () => throw Exception('Discipline not found'),
            )
            .readTable(db.discipline);
        final meet = rows
            .firstWhere(
              (row) =>
                  row.readTable(db.meetEvent).id ==
                  athleteMeetEvent.meetEventId,
              orElse: () => throw Exception('Meet not found'),
            )
            .readTable(db.meet);
        if (meet.startAt.isAfter(DateTime.now())) continue;
        results.add(ResultView(
          athleteMeetEvent: athleteMeetEvent,
          discipline: discipline,
          meet: meet,
        ));
      }

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
    await (db.update(db.athlete)..where((tbl) => tbl.id.equals(athleteId)))
        .write(AthleteCompanion(
      athleteStatusId: Value(statusId),
    ));
    var data = await (db.select(db.athlete)
          ..where(
            (tbl) => tbl.deletedAt.isNull() & tbl.id.equals(athleteId),
          ))
        .getSingle();
    // the json data for sync must be in a list
    ref.read(syncServiceProvider.notifier).addToSyncQueue(
          '/sync/athlete',
          'post',
          jsonEncode(
            {
              'data': [Utils.convertMapKeysToSnakeCase(data.toJson())],
              'primary_keys': ['id'],
              'table': 'athlete',
            },
          ),
        );
  }

  Future<void> updateAthlete(
      {required String athleteId,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String street,
      required String city,
      required String zip,
      required String birthNumber,
      required String note,
      required String statusId,
      String? clubId,
      String? ean,
      DateTime? createdAt,
      bool? delete}) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    final auth = ref.read(authServiceProvider);
    var updated = await db.into(db.athlete).insertReturning(
          mode: InsertMode.insertOrReplace,
          AthleteCompanion(
            id: Value(athleteId),
            birthNumber: Value(birthNumber),
            firstName: Value(firstName),
            lastName: Value(lastName),
            email: Value(email.isNotEmpty ? email : null),
            phone: Value(phone.isNotEmpty ? phone : null),
            street: Value(street),
            city: Value(city),
            zip: Value(zip),
            note: Value(note),
            athleteStatusId: Value(statusId),
            updatedAt: Value(DateTime.now()),
            ean: Value(ean),
            clubId: Value(clubId ?? auth.tenant),
            profilePicture: Value(null),
            createdAt: Value(createdAt ?? DateTime.now()),
            deletedAt: Value(delete == true ? DateTime.now() : null),
          ),
        );
    await sync.addToSyncQueue(
      '/sync/athlete',
      'post',
      jsonEncode(
        {
          'data': [Utils.convertMapKeysToSnakeCase(updated.toJson())],
          'primary_keys': ['id'],
          'table': 'athlete',
        },
      ),
    );
  }
}
