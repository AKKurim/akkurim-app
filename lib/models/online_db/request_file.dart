import 'package:drift/drift.dart';

class RequestFile extends Table {
  TextColumn get requestId => text().withLength(min: 36, max: 36)();
  TextColumn get fileId => text().withLength(min: 36, max: 36).nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {requestId, fileId};
}
