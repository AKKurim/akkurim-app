import 'package:drift/drift.dart';

class RemoteConfig extends Table {
  IntColumn get id => integer().customConstraint("PRIMARY KEY")();
  TextColumn get urgentMessage => text().nullable()();
  TextColumn get minimumAppVersion => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
