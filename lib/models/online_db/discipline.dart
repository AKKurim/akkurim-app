import 'package:drift/drift.dart';
import '_base_model.dart';

class Discipline extends Table with BaseModel {
  IntColumn get id => integer()();
  IntColumn get traditional => integer()();
  IntColumn get disciplineTypeId => integer()();
  TextColumn get description => text()();
  TextColumn get shortDescription => text()();
  TextColumn get descriptionEn => text()();
  TextColumn get shortDescriptionEn => text()();
  

  @override
  Set<Column> get primaryKey => {id};
}
