import 'package:drift/drift.dart';
import '_base_model.dart';

class TrainingTime extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get day => text()();
  TextColumn get summerTime => text()();
  TextColumn get winterTime => text()();
  IntColumn get durationSummer => integer()();
  IntColumn get durationWinter => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
