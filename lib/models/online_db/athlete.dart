import 'package:drift/drift.dart';

class Athlete extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get birthNumber => text().unique()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get street => text()();
  TextColumn get city => text()();
  TextColumn get zip => text()();
  TextColumn get email => text().unique().nullable()();
  TextColumn get phone => text().unique().nullable()();
  TextColumn get ean => text().unique().nullable()();
  TextColumn get note => text().nullable()();
  TextColumn get clubId => text().nullable()();
  TextColumn get profilePicture => text().unique().nullable()();
  TextColumn get athleteStatusId => text().withLength(min: 36, max: 36)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
