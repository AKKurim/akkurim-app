import 'package:drift/drift.dart';
import '_base_model.dart';

class MeetTrainer extends Table with BaseModel {
  TextColumn get meetId => text().withLength(min: 36, max: 36)();
  TextColumn get trainerId => text().withLength(min: 36, max: 36)();
  TextColumn get status => text().nullable()();
  TextColumn get presence => text().nullable()();

  @override
  Set<Column> get primaryKey => {meetId, trainerId};
}
