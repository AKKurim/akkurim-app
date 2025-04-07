import 'package:drift/drift.dart';

class Trainer extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)
      .customConstraint("PRIMARY_KEY")();
  TextColumn get athleteId => text().withLength(min: 36, max: 36).unique()();
  TextColumn get trainerStatusId => text().withLength(min: 36, max: 36)();
  TextColumn get qualification => text()();
  IntColumn get salaryPerHour => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}