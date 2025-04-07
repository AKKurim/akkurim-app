import 'package:drift/drift.dart';

class GroupAthletes extends Table {
  TextColumn get groupId => text().withLength(min: 36, max: 36)();
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {groupId, athleteId};
}
