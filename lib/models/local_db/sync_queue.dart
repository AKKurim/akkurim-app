import 'package:drift/drift.dart';

class SyncQueue extends Table {
  IntColumn get id => integer()();
  TextColumn get endpoint => text()();
  TextColumn get method => text()();
  TextColumn get data => text().nullable()();
  DateTimeColumn get doneAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
