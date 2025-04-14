import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/database/drift_database.dart';
import '../models/views/discipline_view.dart';
import './db_provider.dart';
import 'package:drift/drift.dart';

part 'meet_providers.g.dart';

@riverpod
Stream<List<DisciplineView>> allDisciplines(Ref ref) async* {
  final db = ref.read(dbProvider);
  final query = (db.select(db.discipline)
        ..where(
          (tbl) => tbl.deletedAt.isNull(),
        ))
      .join(
    [
      leftOuterJoin(db.disciplineType,
          db.disciplineType.id.equalsExp(db.discipline.disciplineTypeId)),
    ],
  );

  yield* query.watch().map((rows) {
    return rows.map((row) {
      final discipline = row.readTable(db.discipline);
      final type = row.readTableOrNull(db.disciplineType);

      return DisciplineView(
        discipline: discipline,
        type: type,
      );
    }).toList();
  });
}
