import 'package:drift/drift.dart';

class File extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get type => text()();
  TextColumn get name => text()();
  TextColumn get size => text()();
  TextColumn get mimeType => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
