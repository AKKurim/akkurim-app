import 'package:drift/drift.dart';
import '_base_model.dart';

class Category extends Table with BaseModel {
  IntColumn get id => integer()();
  IntColumn get sex => integer()();
  TextColumn get description => text()();
  TextColumn get shortDescription => text()();
  TextColumn get descriptionEn => text()();
  TextColumn get shortDescriptionEn => text()();
  TextColumn get age => text()();
  

  @override
  Set<Column> get primaryKey => {id};
}
