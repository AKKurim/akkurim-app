import 'package:drift/drift.dart';
import '_base_model.dart';

class RemoteConfig extends Table with BaseModel {
  IntColumn get id => integer()();
  TextColumn get urgentMessage => text().nullable()();
  TextColumn get minimumAppVersion => text()();
  DateTimeColumn get showFrom => dateTime()();
  DateTimeColumn get showTo => dateTime()();
  

  @override
  Set<Column> get primaryKey => {id};
}
