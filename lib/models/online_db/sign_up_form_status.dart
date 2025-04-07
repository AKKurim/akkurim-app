import 'package:drift/drift.dart';

class SignUpFormStatus extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36).customConstraint("PRIMARY_KEY")();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
