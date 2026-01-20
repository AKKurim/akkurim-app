import 'package:drift/drift.dart';
import '_base_model.dart';

class Guardian extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get bankNumber => text().nullable()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get email => text().unique()();
  TextColumn get phone => text().unique().nullable()();
  

  @override
  Set<Column> get primaryKey => {id};
}
