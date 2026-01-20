import 'package:drift/drift.dart';
import '_base_model.dart';

class GroupTrainer extends Table with BaseModel {
  TextColumn get groupId => text().withLength(min: 36, max: 36)();
  TextColumn get trainerId => text().withLength(min: 36, max: 36)();

  @override
  Set<Column> get primaryKey => {groupId, trainerId};
}
