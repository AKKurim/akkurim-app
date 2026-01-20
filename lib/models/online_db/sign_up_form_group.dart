import 'package:drift/drift.dart';
import '_base_model.dart';

class SignUpFormGroup extends Table with BaseModel {
  TextColumn get signUpFormId => text().withLength(min: 36, max: 36)();
  TextColumn get groupId => text().withLength(min: 36, max: 36)();
  

  @override
  Set<Column> get primaryKey => {signUpFormId, groupId};
}
