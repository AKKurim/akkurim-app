import 'package:drift/drift.dart';
import '_base_model.dart';

class Response extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get requestId => text().withLength(min: 36, max: 36)();
  TextColumn get personType => text()();
  TextColumn get personId => text().withLength(min: 36, max: 36).nullable()();
  TextColumn get fileId => text().withLength(min: 36, max: 36).nullable()();
  TextColumn get description => text()();
  

  @override
  Set<Column> get primaryKey => {id};
}
