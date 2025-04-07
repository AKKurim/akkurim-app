import 'package:drift/drift.dart';

class DisciplineType extends Table {
  IntColumn get id => integer().customConstraint("PRIMARY_KEY")();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get nameEn => text().nullable()();
  TextColumn get descriptionEn => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
