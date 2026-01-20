import 'package:drift/drift.dart';
import '_base_model.dart';

class AthleteRegistrationMeetEvent extends Table with BaseModel {
  TextColumn get athleteId => text().withLength(min: 36, max: 36)();
  TextColumn get meetEventId => text().withLength(min: 36, max: 36)();
  TextColumn get status => text()();
  

  @override
  Set<Column> get primaryKey => {athleteId, meetEventId};
}
