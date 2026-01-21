import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import '../../config.dart';

import '../../models/local_db/app_settings.dart';
import '../../models/local_db/sync_queue.dart';
import '../../models/local_db/user_email.dart';

import '../../models/online_db/athlete_guardian.dart';
import '../../models/online_db/athlete_meet_event.dart';
import '../../models/online_db/athlete_registration_meet_event.dart';
import '../../models/online_db/athlete_sign_up_form.dart';
import '../../models/online_db/athlete.dart';
import '../../models/online_db/category.dart';
import '../../models/online_db/club.dart';
import '../../models/online_db/discipline_type.dart';
import '../../models/online_db/discipline.dart';
import '../../models/online_db/file.dart';
import '../../models/online_db/group_athlete.dart';
import '../../models/online_db/group_trainer.dart';
import '../../models/online_db/group.dart';
import '../../models/online_db/guardian.dart';
import '../../models/online_db/helper.dart';
import '../../models/online_db/item_type.dart';
import '../../models/online_db/item.dart';
import '../../models/online_db/meet_trainer.dart';
import '../../models/online_db/meet_event.dart';
import '../../models/online_db/meet.dart';
import '../../models/online_db/payment.dart';
import '../../models/online_db/points.dart';
import '../../models/online_db/remote_config.dart';
import '../../models/online_db/request_file.dart';
import '../../models/online_db/request.dart';
import '../../models/online_db/response.dart';
import '../../models/online_db/school_year.dart';
import '../../models/online_db/sign_up_form.dart';
import '../../models/online_db/sign_up_form_group.dart';
import '../../models/online_db/trainer.dart';
import '../../models/online_db/training_athlete.dart';
import '../../models/online_db/training_time.dart';
import '../../models/online_db/training_trainer.dart';
import '../../models/online_db/training.dart';
import '../../models/online_db/web_post.dart';

part 'drift_database.g.dart';

final modelMap = {
  'app_settings': database.appSetting,
  'sync_queue': database.syncQueue,
  'athlete_guardian': database.athleteGuardian,
  'athlete_meet_event': database.athleteMeetEvent,
  'athlete_registration_meet_event': database.athleteRegistrationMeetEvent,
  'athlete_sign_up_form': database.athleteSignUpForm,
  'athlete': database.athlete,
  'category': database.category,
  'club': database.club,
  'discipline_type': database.disciplineType,
  'discipline': database.discipline,
  'file': database.file,
  'group_athlete': database.groupAthlete,
  'group_trainer': database.groupTrainer,
  'group': database.group,
  'guardian': database.guardian,
  'helper': database.helper,
  'item_type': database.itemType,
  'item': database.item,
  'meet_event': database.meetEvent,
  'meet_trainer': database.meetTrainer,
  'meet': database.meet,
  'payment': database.payment,
  'points': database.points,
  'remote_config': database.remoteConfig,
  'request_file': database.requestFile,
  'request': database.request,
  'response': database.response,
  'school_year': database.schoolYear,
  'sign_up_form': database.signUpForm,
  'sign_up_form_group': database.signUpFormGroup,
  'trainer': database.trainer,
  'training_athlete': database.trainingAthlete,
  'training_time': database.trainingTime,
  'training_trainer': database.trainingTrainer,
  'training': database.training,
  'web_post': database.webPost,
};

@DriftDatabase(
  tables: [
    AppSetting,
    SyncQueue,
    UserEmail,
    AthleteGuardian,
    AthleteMeetEvent,
    AthleteRegistrationMeetEvent,
    AthleteSignUpForm,
    Athlete,
    Category,
    Club,
    DisciplineType,
    Discipline,
    File,
    GroupAthlete,
    GroupTrainer,
    Group,
    Guardian,
    Helper,
    ItemType,
    Item,
    MeetEvent,
    MeetTrainer,
    Meet,
    Payment,
    Points,
    RemoteConfig,
    RequestFile,
    Request,
    Response,
    SchoolYear,
    SignUpFormGroup,
    SignUpForm,
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
  int get schemaVersion => 9;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from != 6 && to != 9) {
            return;
          }
          print('Upgrading database from $from to $to');
          try {
            for (final String table in modelMap.keys) {
              print('Dropping table: $table');
              await m.deleteTable(table);
            }
            await m.createAll();
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
