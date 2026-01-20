import 'package:drift/drift.dart';
import '_base_model.dart';

class Meet extends Table with BaseModel {
  TextColumn get id => text()();
  TextColumn get type => text()();
  TextColumn get externalId => text().nullable()();
  TextColumn get name => text()();
  DateTimeColumn get startAt => dateTime()();
  DateTimeColumn get registrationStartAt => dateTime().nullable()();
  DateTimeColumn get endAt => dateTime()();
  DateTimeColumn get registrationEndAt => dateTime().nullable()();
  IntColumn get registrationLimit => integer().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get organizer => text().nullable()();
  

  @override
  Set<Column> get primaryKey => {id};
}
