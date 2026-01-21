import 'package:drift/drift.dart';
import '_base_model.dart';

class Training extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  DateTimeColumn get startAt => dateTime()();
  TextColumn get groupId => text().withLength(min: 36, max: 36)();
  TextColumn get description => text().nullable()();
  IntColumn get durationMinutes => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
