import 'package:drift/drift.dart';
import '_base_model.dart';

class DisciplineType extends Table with BaseModel {
  IntColumn get id => integer()();
  TextColumn get sort => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get nameEn => text().nullable()();
  TextColumn get descriptionEn => text().nullable()();
  

  @override
  Set<Column> get primaryKey => {id};
}
