import 'package:drift/drift.dart';

class UserEmail extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text().withLength(min: 1, max: 100)();
}
