import 'package:drift/drift.dart';

class AthleteMeetEvent extends Table {
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  TextColumn get meetEventId => text().withLength(min: 36, max: 36)();
  TextColumn get result => text().nullable()();
  TextColumn get wind => text().nullable()();
  TextColumn get pbSb => text().nullable()();
  TextColumn get points => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {athleteId, meetEventId};
}
