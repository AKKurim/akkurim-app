import 'package:drift/drift.dart';

class AthleteGuardians extends Table {
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  TextColumn get guardianId => text().withLength(min: 36, max: 36)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {athleteId, guardianId};
}
