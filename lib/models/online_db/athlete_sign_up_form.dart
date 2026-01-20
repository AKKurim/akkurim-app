import 'package:drift/drift.dart';
import '_base_model.dart';

class AthleteSignUpForm extends Table with BaseModel {
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  TextColumn get signUpFormId => text().withLength(min: 36, max: 36)();
  

  @override
  Set<Column> get primaryKey => {athleteId, signUpFormId};
}
