import 'package:drift/drift.dart';

class GroupTrainer extends Table {
  TextColumn get groupId => text().withLength(min: 36, max: 36)();
  TextColumn get trainerId => text().withLength(min: 36, max: 36)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {groupId, trainerId};
}
