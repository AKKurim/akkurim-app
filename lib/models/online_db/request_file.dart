import 'package:drift/drift.dart';
import '_base_model.dart';

class RequestFile extends Table with BaseModel {
  TextColumn get requestId => text().withLength(min: 36, max: 36)();
  TextColumn get fileId => text().withLength(min: 36, max: 36).nullable()();
  

  @override
  Set<Column> get primaryKey => {requestId, fileId};
}
