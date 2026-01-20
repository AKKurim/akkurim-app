import 'package:drift/drift.dart';
import '_base_model.dart';

class TrainingAthlete extends Table with BaseModel {
  TextColumn get trainingId => text().withLength(min: 36, max: 36)();
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  TextColumn get presence => text()();

  @override
  Set<Column> get primaryKey => {trainingId, athleteId};
}
