import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import '../../models/local_db/app_settings.dart';
import '../../utils/config.dart';

part 'drift_database.g.dart';
// TODO import all models

@DriftDatabase(tables: [AppSetting])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: Config.dbName,
      native: const DriftNativeOptions(
          // By default, `driftDatabase` from `package:drift_flutter` stores the
          // database files in `getApplicationDocumentsDirectory()`.
          // databasePath: getApplicationSupportDirectory,
          ),
    );
  }
}

final database = AppDatabase();
