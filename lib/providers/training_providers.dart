import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../services/database/drift_database.dart';
import './db_provider.dart';
import 'package:drift/drift.dart';

part 'training_providers.g.dart';

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
