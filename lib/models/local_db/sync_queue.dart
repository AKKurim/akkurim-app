import 'package:drift/drift.dart';

class SyncQueue extends Table {
  IntColumn get id => integer()();
  TextColumn get endpoint => text()();
  TextColumn get method => text()();
  TextColumn get type =>
      text()(); // json/file in case of a file the data will be a local path
  TextColumn get data => text().nullable()();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get doneAt => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
