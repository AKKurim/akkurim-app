import 'package:drift/drift.dart';
import '_base_model.dart';

class Request extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get type => text()();
  TextColumn get status => text()();
  TextColumn get personId => text().withLength(min: 36, max: 36).nullable()();
  TextColumn get itemId => text().withLength(min: 36, max: 36).nullable()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  

  @override
  Set<Column> get primaryKey => {id};
}
