import 'package:drift/drift.dart';

class TrainingAthlete extends Table {
  TextColumn get trainingId => text().withLength(min: 36, max: 36)();
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  TextColumn get presence => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {trainingId, athleteId};
}
