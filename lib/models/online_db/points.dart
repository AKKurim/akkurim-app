import 'package:drift/drift.dart';
import '_base_model.dart';

class Points extends Table with BaseModel {
  TextColumn get type => text()();
  TextColumn get sourceId => text().withLength(min: 36, max: 36)();
  IntColumn get amount => integer()();
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  

  @override
  Set<Column> get primaryKey => {type, sourceId, athleteId};
}
