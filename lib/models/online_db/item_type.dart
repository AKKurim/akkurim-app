import 'package:drift/drift.dart';
import '_base_model.dart';

class ItemType extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get name => text()();
  TextColumn get type => text().nullable()();
  

  @override
  Set<Column> get primaryKey => {id};
}
