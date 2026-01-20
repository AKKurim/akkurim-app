import 'package:drift/drift.dart';
import '_base_model.dart';

class Group extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  IntColumn get system => integer()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get trainingTimeId => text().withLength(min: 36, max: 36)();
  TextColumn get schoolYearId => text().withLength(min: 36, max: 36)();
  

  @override
  Set<Column> get primaryKey => {id};
}
