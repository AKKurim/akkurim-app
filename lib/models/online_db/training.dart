import 'package:drift/drift.dart';
import '_base_model.dart';

class Training extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get name => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get groupId => text().nullable()();
  TextColumn get trainerId => text().nullable()();
  TextColumn get trainingTimeId => text().nullable()();
  TextColumn get disciplineId => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
