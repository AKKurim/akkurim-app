import 'package:drift/drift.dart';

class SignUpForm extends Table {
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
  TextColumn get signUpFormStatusId => text().withLength(min: 36, max: 36)();
  TextColumn get schoolYearId => text().withLength(min: 36, max: 36)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
