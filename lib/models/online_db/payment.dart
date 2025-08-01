import 'package:drift/drift.dart';

class Payment extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
  RealColumn get amount => real()();
  TextColumn get status => text()();
  TextColumn get fromId => text().withLength(min: 36, max: 36).nullable()();
  TextColumn get toId => text().withLength(min: 36, max: 36).nullable()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
