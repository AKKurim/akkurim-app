import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import '../../config.dart';

import '../../models/local_db/app_settings.dart';
import '../../models/local_db/sync_queue.dart';
import '../../models/local_db/user_email.dart';

import '../../models/online_db/athlete_guardian.dart';
import '../../models/online_db/athlete_meet_event.dart';
import '../../models/online_db/athlete_sign_up_form.dart';
import '../../models/online_db/athlete_status.dart';
import '../../models/online_db/athlete.dart';
import '../../models/online_db/category.dart';
import '../../models/online_db/club.dart';
import '../../models/online_db/discipline_type.dart';
import '../../models/online_db/discipline.dart';
import '../../models/online_db/group_athlete.dart';
import '../../models/online_db/group_trainer.dart';
import '../../models/online_db/group.dart';
import '../../models/online_db/guardian.dart';
import '../../models/online_db/item_type.dart';
import '../../models/online_db/item.dart';
import '../../models/online_db/meet_event.dart';
import '../../models/online_db/meet.dart';
import '../../models/online_db/remote_config.dart';
import '../../models/online_db/school_year.dart';
import '../../models/online_db/sign_up_form_status.dart';
import '../../models/online_db/sign_up_form.dart';
import '../../models/online_db/trainer_status.dart';
import '../../models/online_db/trainer.dart';
import '../../models/online_db/training_athlete.dart';
import '../../models/online_db/training_time.dart';
import '../../models/online_db/training_trainer.dart';
import '../../models/online_db/training.dart';
import '../../models/online_db/web_post.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    AppSetting,
    SyncQueue,
    UserEmail,
    AthleteGuardian,
    AthleteMeetEvent,
    AthleteSignUpForm,
    AthleteStatus,
    Athlete,
    Category,
    Club,
    DisciplineType,
    Discipline,
    GroupAthlete,
    GroupTrainer,
    Group,
    Guardian,
    ItemType,
    Item,
    MeetEvent,
    Meet,
    RemoteConfig,
    SchoolYear,
    SignUpFormStatus,
    SignUpForm,
    TrainerStatus,
    Trainer,
    TrainingAthlete,
    TrainingTime,
    TrainingTrainer,
    Training,
    WebPost,
  ],
)
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 6;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          // This is called when the database is opened and the schema version
          // is higher than the previous version.
          print('Upgrading database from $from to $to');
          try {
            await m.createAll();
            await m.addColumn(
              athleteMeetEvent,
              athleteMeetEvent.wind,
            );
            await m.addColumn(
              athleteMeetEvent,
              athleteMeetEvent.pbSb,
            );
            await m.addColumn(
              athleteMeetEvent,
              athleteMeetEvent.points,
            );
          } catch (e) {
            print('Error creating tables: $e');
          }
        },
      );

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
