import 'package:drift/drift.dart';
import '_base_model.dart';

class Group extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  IntColumn get system => integer()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get schoolYearId => text().withLength(min: 36, max: 36)();

  // TextColumn get trainingTimeId =>
  //     text().withLength(min: 36, max: 36).nullable()();

  TextColumn get dayOfWeek => text().nullable()();
  TextColumn get summerTime => text().nullable()(); // Store 'HH:mm'
  TextColumn get winterTime => text().nullable()();
  IntColumn get durationSummer => integer().nullable()();
  IntColumn get durationWinter => integer().nullable()();
  TextColumn get defaultLocationSummer => text().nullable()();
  TextColumn get defaultLocationWinter => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
