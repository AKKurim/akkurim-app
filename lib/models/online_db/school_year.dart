import 'package:drift/drift.dart';
import '_base_model.dart';

class SchoolYear extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get name => text()();
  

  @override
  Set<Column> get primaryKey => {id};
}
