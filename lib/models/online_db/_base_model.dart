import 'package:drift/drift.dart';

mixin BaseModel on Table {
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
  TextColumn get lastUpdatedBy => text().withLength(min: 0, max: 36).nullable()();
}