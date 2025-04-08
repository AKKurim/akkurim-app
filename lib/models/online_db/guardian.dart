import 'package:drift/drift.dart';

class Guardian extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get email => text().unique()();
  TextColumn get phone => text().unique()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
