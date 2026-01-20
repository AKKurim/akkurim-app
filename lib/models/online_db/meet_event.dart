import 'package:drift/drift.dart';
import '_base_model.dart';

class MeetEvent extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get meetId => text()();
  IntColumn get disciplineId => integer()();
  IntColumn get categoryId => integer()();
  DateTimeColumn get startAt => dateTime()();
  TextColumn get phase => text().nullable()();
  IntColumn get count => integer().nullable()();
  

  @override
  Set<Column> get primaryKey => {id};
}
