import 'package:drift/drift.dart';
import 'package:flutter/material.dart' as fm;

class Club extends Table {
  TextColumn get id => text().customConstraint("PRIMARY_KEY")();
  TextColumn get name => text()();
  TextColumn get description => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}
