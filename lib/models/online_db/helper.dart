import 'package:drift/drift.dart';
import '_base_model.dart';

class Helper extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get status => text()();
  TextColumn get bankNumber => text().nullable()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  DateTimeColumn get dateOfBirth => dateTime().nullable()();
  TextColumn get email => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get street => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get zip => text().nullable()();
  TextColumn get qualification => text().nullable()();
  TextColumn get preferrence => text().nullable()();
  

  @override
  Set<Column> get primaryKey => {id};
}
