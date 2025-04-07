import 'package:drift/drift.dart';

class Club extends Table {
  TextColumn get id => text().customConstraint("PRIMARY_KEY")();
  TextColumn get name => text()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
