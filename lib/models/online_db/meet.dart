import 'package:drift/drift.dart';

class Meet extends Table {
  TextColumn get id => text().customConstraint("PRIMARY KEY")();
  TextColumn get name => text()();
  DateTimeColumn get startAt => dateTime()();
  DateTimeColumn get endAt => dateTime()();
  TextColumn get location => text().nullable()();
  TextColumn get organizer => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
