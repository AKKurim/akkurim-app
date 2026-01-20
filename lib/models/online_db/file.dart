import 'package:drift/drift.dart';
import '_base_model.dart';

class File extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get type => text()();
  TextColumn get name => text()();
  TextColumn get size => text()();
  TextColumn get mimeType => text()();
  

  @override
  Set<Column> get primaryKey => {id};
}
