import 'package:drift/drift.dart';
import '_base_model.dart';

class Payment extends Table with BaseModel {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
  RealColumn get amount => real()();
  TextColumn get status => text()();
  TextColumn get fromId => text().withLength(min: 36, max: 36).nullable()();
  TextColumn get toId => text().withLength(min: 36, max: 36).nullable()();
  TextColumn get description => text().nullable()();
  

  // @override
  // Set<Column> get primaryKey => {id};
}
