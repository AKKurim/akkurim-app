import 'package:drift/drift.dart';
import '_base_model.dart';

class Club extends Table with BaseModel {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {id};
}
