import 'package:drift/drift.dart';
import '_base_model.dart';

class Athlete extends Table with BaseModel {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get bankNumber => text().nullable()();
  TextColumn get birthNumber => text().unique()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get street => text()();
  TextColumn get city => text()();
  TextColumn get zip => text()();
  TextColumn get email => text().unique().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get ean => text().unique().nullable()();
  TextColumn get note => text().nullable()();
  TextColumn get clubId => text().nullable()();
  TextColumn get profileImageId =>
      text().unique().withLength(min: 36, max: 36).nullable()();
  TextColumn get status => text()();

  @override
  Set<Column> get primaryKey => {id};
}
