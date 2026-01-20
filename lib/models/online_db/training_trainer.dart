import 'package:drift/drift.dart';
import '_base_model.dart';

class TrainingTrainer extends Table with BaseModel {
  TextColumn get trainingId => text().withLength(min: 36, max: 36)();
  TextColumn get trainerId => text().withLength(min: 36, max: 36)();
  TextColumn get presence => text().nullable()();
  

  @override
  Set<Column> get primaryKey => {trainingId, trainerId};
}
