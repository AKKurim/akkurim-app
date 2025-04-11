import 'package:drift/drift.dart';

class WebPost extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get trainerId => text().withLength(min: 36, max: 36)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
