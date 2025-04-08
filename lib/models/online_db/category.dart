import 'package:drift/drift.dart';

class Category extends Table {
  IntColumn get id => integer()();
  IntColumn get sex => integer()();
  TextColumn get description => text()();
  TextColumn get shortDescription => text()();
  TextColumn get descriptionEn => text()();
  TextColumn get shortDescriptionEn => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
