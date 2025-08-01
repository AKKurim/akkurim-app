import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/views/simple_athlete_view.dart';
import './db_provider.dart';
import 'package:drift/drift.dart';

part 'simple_athletes_provider.g.dart';

@riverpod
class SimpleAthletesP extends _$SimpleAthletesP {
  @override
  Stream<List<SimpleAthleteView>> build() async* {
    final db = ref.read(dbProvider);
    final query = (db.select(db.athlete)
          ..where(
            (tbl) => tbl.deletedAt.isNull(),
          ))
        .join(
      [
        leftOuterJoin(db.club, db.club.id.equalsExp(db.athlete.clubId)),
      ],
    );

    yield* query.watch().map((rows) {
      return rows.map((row) {
        final athlete = row.readTable(db.athlete);

        final club = row.readTableOrNull(db.club);

        return SimpleAthleteView(
          athlete: athlete,
          club: club,
        );
      }).toList();
    });
  }
}
