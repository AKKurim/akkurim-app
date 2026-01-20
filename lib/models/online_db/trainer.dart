import 'package:drift/drift.dart';
import '_base_model.dart';

class Trainer extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get athleteId => text().withLength(min: 36, max: 36).unique()();
  TextColumn get bankNumber => text().nullable()();
  TextColumn get status => text()();
  TextColumn get qualification => text()();
  IntColumn get salaryPerHour => integer()();
  

  @override
  Set<Column> get primaryKey => {id};
}
