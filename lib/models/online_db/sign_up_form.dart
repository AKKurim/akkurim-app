import 'package:drift/drift.dart';
import '_base_model.dart';

class SignUpForm extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get birthNumber => text()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get street => text()();
  TextColumn get city => text()();
  TextColumn get zip => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get guardianFirstName1 => text()();
  TextColumn get guardianLastName1 => text()();
  TextColumn get guardianFirstName2 => text().nullable()();
  TextColumn get guardianLastName2 => text().nullable()();
  TextColumn get guardianPhone1 => text()();
  TextColumn get guardianEmail1 => text()();
  TextColumn get guardianPhone2 => text().nullable()();
  TextColumn get guardianEmail2 => text().nullable()();
  TextColumn get note => text().nullable()();
  TextColumn get status => text()();
  TextColumn get schoolYearId => text().withLength(min: 36, max: 36)();
  IntColumn get timesPerWeek => integer()();
  TextColumn get daysInWeek => text()();
  

  @override
  Set<Column> get primaryKey => {id};
}
