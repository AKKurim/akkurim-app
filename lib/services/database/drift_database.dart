import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import '../../utils/config.dart';

import '../../models/local_db/app_settings.dart';
import '../../models/local_db/sync_queue.dart';

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
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'test.db',
      native: const DriftNativeOptions(
          // By default, `driftDatabase` from `package:drift_flutter` stores the
          // database files in `getApplicationDocumentsDirectory()`.
          // databasePath: getApplicationSupportDirectory,
          ),
    );
  }
}

final database = AppDatabase();
final Map<String, Table> modelMap = {
  'sync_queue': SyncQueue(),
  'app_setting': AppSetting(),
  'athlete_guardian': AthleteGuardian(),
  'athlete_meet_event': AthleteMeetEvent(),
  'athlete_sign_up_form': AthleteSignUpForm(),
  'athlete_status': AthleteStatus(),
  'athlete': Athlete(),
  'category': Category(),
  'club': Club(),
  'discipline_type': DisciplineType(),
  'discipline': Discipline(),
  'group_athlete': GroupAthlete(),
  'group_trainer': GroupTrainer(),
  'group': Group(),
  'guardian': Guardian(),
  'item_type': ItemType(),
  'item': Item(),
  'meet_event': MeetEvent(),
  'meet': Meet(),
  'remote_config': RemoteConfig(),
  'school_year': SchoolYear(),
  'sign_up_form_status': SignUpFormStatus(),
  'sign_up_form': SignUpForm(),
  'trainer_status': TrainerStatus(),
  'trainer': Trainer(),
  'training_athlete': TrainingAthlete(),
  'training_time': TrainingTime(),
  'training_trainer': TrainingTrainer(),
  'training': Training(),
  'web_post': WebPost(),
};
