import 'package:drift/drift.dart';

class Training extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  DateTimeColumn get datetime => dateTime()();
  TextColumn get groupId => text().withLength(min: 36, max: 36)();
  TextColumn get description => text().nullable()();
  IntColumn get durationMinutes => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
