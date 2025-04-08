import 'package:drift/drift.dart';

class SchoolYear extends Table {
  TextColumn get id =>
      text().withLength(min: 36, max: 36).customConstraint("PRIMARY KEY")();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
