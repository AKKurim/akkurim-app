import 'package:drift/drift.dart';

class TrainingTime extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get day => text()();
  TextColumn get summerTime => text()();
  TextColumn get winterTime => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
