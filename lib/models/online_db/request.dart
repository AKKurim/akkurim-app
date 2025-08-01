import 'package:drift/drift.dart';

class Request extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get type => text()();
  TextColumn get status => text()();
  TextColumn get personId => text().withLength(min: 36, max: 36).nullable()();
  TextColumn get itemId => text().withLength(min: 36, max: 36).nullable()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
