import 'package:drift/drift.dart';

class MeetEvent extends Table {
  TextColumn get id =>
      text().withLength(min: 36, max: 36).customConstraint("PRIMARY KEY")();
  TextColumn get meetId => text()();
  TextColumn get meetType => text()();
  IntColumn get disciplineId => integer()();
  IntColumn get categoryId => integer()();
  DateTimeColumn get startAt => dateTime()();
  TextColumn get phase => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
