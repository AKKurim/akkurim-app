import 'package:drift/drift.dart';
import '_base_model.dart';

class WebPost extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get title => text()();
  TextColumn get coverImageId => text().withLength(min: 36, max: 36)();
  TextColumn get content => text()();
  TextColumn get trainerId => text().withLength(min: 36, max: 36)();
  

  @override
  Set<Column> get primaryKey => {id};
}
