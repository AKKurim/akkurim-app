import 'package:drift/drift.dart';
import '_base_model.dart';

class AthleteGuardian extends Table with BaseModel {
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  TextColumn get guardianId => text().withLength(min: 36, max: 36)();
  

  @override
  Set<Column> get primaryKey => {athleteId, guardianId};
}
