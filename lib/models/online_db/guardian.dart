import 'package:drift/drift.dart';

class Guardian extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get bankNumber => text().nullable()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get email => text().unique()();
  TextColumn get phone => text().unique().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
