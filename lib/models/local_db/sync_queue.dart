import 'package:drift/drift.dart';

class SyncQueue extends Table {
  IntColumn get id => integer().customConstraint("PRIMARY_KEY")();
  TextColumn get endpoint => text()();
  TextColumn get method => text()();
  TextColumn get data => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
