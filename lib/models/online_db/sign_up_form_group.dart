import 'package:drift/drift.dart';

class SignUpFormGroup extends Table {
  TextColumn get signUpFormId => text().withLength(min: 36, max: 36)();
  TextColumn get groupId => text().withLength(min: 36, max: 36)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {signUpFormId, groupId};
}
