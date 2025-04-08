import 'package:drift/drift.dart';

class Group extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get trainingTimeId => text().withLength(min: 36, max: 36)();
  TextColumn get schoolYearId => text().withLength(min: 36, max: 36)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
