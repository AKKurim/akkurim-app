import 'package:drift/drift.dart';

class Response extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get requestId => text().withLength(min: 36, max: 36)();
  TextColumn get personType => text()();
  TextColumn get personId => text().withLength(min: 36, max: 36).nullable()();
  TextColumn get fileId => text().withLength(min: 36, max: 36).nullable()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
