import 'package:drift/drift.dart';

class Points extends Table {
  TextColumn get type => text()();
  TextColumn get sourceId => text().withLength(min: 36, max: 36)();
  IntColumn get amount => integer()();
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {type, sourceId, athleteId};
}
