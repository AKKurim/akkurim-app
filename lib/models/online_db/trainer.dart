import 'package:drift/drift.dart';

class Trainer extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get athleteId => text().withLength(min: 36, max: 36).unique()();
  TextColumn get bankNumber => text().nullable()();
  TextColumn get status => text()();
  TextColumn get qualification => text()();
  IntColumn get salaryPerHour => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
