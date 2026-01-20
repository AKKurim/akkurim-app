import 'package:drift/drift.dart';
import '_base_model.dart';

class AthleteMeetEvent extends Table with BaseModel {
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  TextColumn get meetEventId => text().withLength(min: 36, max: 36)();
  TextColumn get result => text().nullable()();
  TextColumn get wind => text().nullable()();
  TextColumn get pbSb => text().nullable()();
  TextColumn get points => text().nullable()();
  TextColumn get bib => text().nullable()();
  

  @override
  Set<Column> get primaryKey => {athleteId, meetEventId};
}
