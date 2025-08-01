import 'package:drift/drift.dart';

class TrainingTime extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get day => text()();
  TextColumn get summerTime => text()();
  TextColumn get winterTime => text()();
  IntColumn get durationSummer => integer()();
  IntColumn get durationWinter => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
