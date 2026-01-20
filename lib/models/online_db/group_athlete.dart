import 'package:drift/drift.dart';
import '_base_model.dart';

class GroupAthlete extends Table with BaseModel {
  TextColumn get groupId => text().withLength(min: 36, max: 36)();
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  

  @override
  Set<Column> get primaryKey => {groupId, athleteId};
}
