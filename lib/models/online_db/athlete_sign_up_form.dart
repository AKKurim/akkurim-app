import 'package:drift/drift.dart';

class AthleteSignUpForm extends Table {
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  TextColumn get signUpFormId => text().withLength(min: 36, max: 36)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {athleteId, signUpFormId};
}
