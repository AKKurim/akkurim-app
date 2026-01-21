import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/views/trainer_view.dart';
import '../models/views/simple_athlete_view.dart';
import './db_provider.dart';
import 'package:drift/drift.dart';
import '../services/auth/auth_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'trainer_provider.g.dart';

@riverpod
class TrainerP extends _$TrainerP {
  @override
  Stream<List<TrainerView>> build() async* {
    final db = ref.watch(dbProvider);
    final query = (db.select(db.trainer)
          ..where(
            (tbl) => tbl.deletedAt.isNull(),
          ))
        .join(
      [
        leftOuterJoin(
          db.athlete,
          db.athlete.id.equalsExp(db.trainer.athleteId),
        ),
        leftOuterJoin(db.club, db.club.id.equalsExp(db.athlete.clubId)),
      ],
    );

    yield* query.watch().map((rows) {
      return rows.map((row) {
        final trainer = row.readTable(db.trainer);
        final athlete = row.readTableOrNull(db.athlete);
        final club = row.readTableOrNull(db.club);

        return TrainerView(
          trainer: trainer,
          simpleAthlete: SimpleAthleteView(
            athlete: athlete!,
            club: club,
          ),
        );
      }).toList();
    });
  }

  // Add methods to mutate the state
}

@riverpod
Stream<TrainerView> currentTrainer(Ref ref) async* {
  final authService = await ref.watch(authServiceProvider.future);
  final db = ref.watch(dbProvider);
  final query = (db.select(db.athlete)
        ..where(
          (tbl) => tbl.email.equals(authService.email ?? ''),
        ))
      .join(
    [
      leftOuterJoin(
        db.trainer,
        db.athlete.id.equalsExp(db.trainer.athleteId),
      ),
      leftOuterJoin(db.club, db.club.id.equalsExp(db.athlete.clubId)),
    ],
  );

  yield* query.watch().map((rows) {
    return rows
        .map((row) {
          final trainer = row.readTable(db.trainer);
          final athlete = row.readTableOrNull(db.athlete);
          final club = row.readTableOrNull(db.club);

          return TrainerView(
            trainer: trainer,
            simpleAthlete: SimpleAthleteView(
              athlete: athlete!,
              club: club,
            ),
          );
        })
        .toList()
        .first;
  });
}
