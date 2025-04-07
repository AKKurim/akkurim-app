import 'package:drift/drift.dart';

class TrainingTrainer extends Table {
  TextColumn get trainingId => text().withLength(min: 36, max: 36)();
  TextColumn get trainerId => text().withLength(min: 36, max: 36)();
  TextColumn get presence => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {trainingId, trainerId};
}
