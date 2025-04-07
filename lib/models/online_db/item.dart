import 'package:drift/drift.dart';

class Item extends Table {
  TextColumn get id =>
      text().withLength(min: 36, max: 36).customConstraint("PRIMARY_KEY")();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get image => text().nullable()();
  IntColumn get count => integer()();
  TextColumn get itemTypeId => text().withLength(min: 36, max: 36)();
  TextColumn get athleteId => text().withLength(min: 36, max: 36).nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
