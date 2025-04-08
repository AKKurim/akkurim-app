import 'package:drift/drift.dart';

class Discipline extends Table {
  IntColumn get id => integer()();
  IntColumn get disciplineTypeId => integer()();
  TextColumn get description => text()();
  TextColumn get shortDescription => text()();
  TextColumn get descriptionEn => text()();
  TextColumn get shortDescriptionEn => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
