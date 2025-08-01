import 'package:drift/drift.dart';

class Meet extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  TextColumn get externalId => text().nullable()();
  TextColumn get name => text()();
  DateTimeColumn get startAt => dateTime()();
  DateTimeColumn get registrationStartAt => dateTime().nullable()();
  DateTimeColumn get endAt => dateTime()();
  DateTimeColumn get registrationEndAt => dateTime().nullable()();
  IntColumn get registrationLimit => integer().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get organizer => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
