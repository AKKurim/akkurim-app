import './drift_database.dart';
import 'package:drift/drift.dart';

// GENERATED COMPANION BUILDERS

AppSettingCompanion buildAppSettingCompanion(Map<String, dynamic> row) =>
    AppSettingCompanion(
      id: Value(row['id']),
      locale: Value(row['locale']),
      themeMode: Value(row['theme_mode']),
    );

SyncQueueCompanion buildSyncQueueCompanion(Map<String, dynamic> row) =>
    SyncQueueCompanion(
      id: Value(row['id']),
      endpoint: Value(row['endpoint']),
      method: Value(row['method']),
      data: row['data'] != null ? Value(row['data']) : const Value.absent(),
      doneAt:
          row['done_at'] != null ? Value(row['done_at']) : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
    );

AthleteGuardianCompanion buildAthleteGuardianCompanion(
        Map<String, dynamic> row) =>
    AthleteGuardianCompanion(
      athleteId: Value(row['athlete_id']),
      guardianId: Value(row['guardian_id']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

AthleteMeetEventCompanion buildAthleteMeetEventCompanion(
        Map<String, dynamic> row) =>
    AthleteMeetEventCompanion(
      athleteId: Value(row['athlete_id']),
      meetEventId: Value(row['meet_event_id']),
      result:
          row['result'] != null ? Value(row['result']) : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

AthleteSignUpFormCompanion buildAthleteSignUpFormCompanion(
        Map<String, dynamic> row) =>
    AthleteSignUpFormCompanion(
      athleteId: Value(row['athlete_id']),
      signUpFormId: Value(row['sign_up_form_id']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

AthleteStatusCompanion buildAthleteStatusCompanion(Map<String, dynamic> row) =>
    AthleteStatusCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

AthleteCompanion buildAthleteCompanion(Map<String, dynamic> row) =>
    AthleteCompanion(
      id: Value(row['id']),
      birthNumber: Value(row['birth_number']),
      firstName: Value(row['first_name']),
      lastName: Value(row['last_name']),
      street: Value(row['street']),
      city: Value(row['city']),
      zip: Value(row['zip']),
      email: row['email'] != null ? Value(row['email']) : const Value.absent(),
      phone: row['phone'] != null ? Value(row['phone']) : const Value.absent(),
      ean: row['ean'] != null ? Value(row['ean']) : const Value.absent(),
      note: row['note'] != null ? Value(row['note']) : const Value.absent(),
      clubId:
          row['club_id'] != null ? Value(row['club_id']) : const Value.absent(),
      profilePicture: row['profile_picture'] != null
          ? Value(row['profile_picture'])
          : const Value.absent(),
      athleteStatusId: Value(row['athlete_status_id']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

CategoryCompanion buildCategoryCompanion(Map<String, dynamic> row) =>
    CategoryCompanion(
      id: Value(row['id']),
      sex: Value(row['sex']),
      description: Value(row['description']),
      shortDescription: Value(row['short_description']),
      descriptionEn: Value(row['description_en']),
      shortDescriptionEn: Value(row['short_description_en']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

ClubCompanion buildClubCompanion(Map<String, dynamic> row) => ClubCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: Value(row['description']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

DisciplineTypeCompanion buildDisciplineTypeCompanion(
        Map<String, dynamic> row) =>
    DisciplineTypeCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

DisciplineCompanion buildDisciplineCompanion(Map<String, dynamic> row) =>
    DisciplineCompanion(
      id: Value(row['id']),
      disciplineTypeId: Value(row['discipline_type_id']),
      description: Value(row['description']),
      shortDescription: Value(row['short_description']),
      descriptionEn: Value(row['description_en']),
      shortDescriptionEn: Value(row['short_description_en']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

GroupAthleteCompanion buildGroupAthleteCompanion(Map<String, dynamic> row) =>
    GroupAthleteCompanion(
      groupId: Value(row['group_id']),
      athleteId: Value(row['athlete_id']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

GroupTrainerCompanion buildGroupTrainerCompanion(Map<String, dynamic> row) =>
    GroupTrainerCompanion(
      groupId: Value(row['group_id']),
      trainerId: Value(row['trainer_id']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

GroupCompanion buildGroupCompanion(Map<String, dynamic> row) => GroupCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      trainingTimeId: Value(row['training_time_id']),
      schoolYearId: Value(row['school_year_id']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

GuardianCompanion buildGuardianCompanion(Map<String, dynamic> row) =>
    GuardianCompanion(
      id: Value(row['id']),
      firstName: Value(row['first_name']),
      lastName: Value(row['last_name']),
      email: Value(row['email']),
      phone: Value(row['phone']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

ItemTypeCompanion buildItemTypeCompanion(Map<String, dynamic> row) =>
    ItemTypeCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

ItemCompanion buildItemCompanion(Map<String, dynamic> row) => ItemCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      image: row['image'] != null ? Value(row['image']) : const Value.absent(),
      count: Value(row['count']),
      itemTypeId: Value(row['item_type_id']),
      athleteId: row['athlete_id'] != null
          ? Value(row['athlete_id'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

MeetEventCompanion buildMeetEventCompanion(Map<String, dynamic> row) =>
    MeetEventCompanion(
      id: Value(row['id']),
      meetId: Value(row['meet_id']),
      meetType: Value(row['meet_type']),
      disciplineId: Value(row['discipline_id']),
      categoryId: Value(row['category_id']),
      startAt: Value(DateTime.parse(row['start_at'])),
      phase: row['phase'] != null ? Value(row['phase']) : const Value.absent(),
      createdAt: row['created_at'] != null
          ? Value(DateTime.parse(row['created_at']))
          : const Value.absent(),
      updatedAt: row['updated_at'] != null
          ? Value(DateTime.parse(row['updated_at']))
          : const Value.absent(),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

MeetCompanion buildMeetCompanion(Map<String, dynamic> row) => MeetCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      startAt: Value(DateTime.parse(row['start_at'])),
      endAt: Value(DateTime.parse(row['end_at'])),
      location: row['location'] != null
          ? Value(row['location'])
          : const Value.absent(),
      organizer: row['organizer'] != null
          ? Value(row['organizer'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

RemoteConfigCompanion buildRemoteConfigCompanion(Map<String, dynamic> row) =>
    RemoteConfigCompanion(
      id: Value(row['id']),
      urgentMessage: row['urgent_message'] != null
          ? Value(row['urgent_message'])
          : const Value.absent(),
      minimumAppVersion: Value(row['minimum_app_version']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

SchoolYearCompanion buildSchoolYearCompanion(Map<String, dynamic> row) =>
    SchoolYearCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

SignUpFormStatusCompanion buildSignUpFormStatusCompanion(
        Map<String, dynamic> row) =>
    SignUpFormStatusCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

SignUpFormCompanion buildSignUpFormCompanion(Map<String, dynamic> row) =>
    SignUpFormCompanion(
      id: Value(row['id']),
      birthNumber: Value(row['birth_number']),
      firstName: Value(row['first_name']),
      lastName: Value(row['last_name']),
      street: Value(row['street']),
      city: Value(row['city']),
      zip: Value(row['zip']),
      email: row['email'] != null ? Value(row['email']) : const Value.absent(),
      phone: row['phone'] != null ? Value(row['phone']) : const Value.absent(),
      guardianFirstName1: Value(row['guardian_first_name1']),
      guardianLastName1: Value(row['guardian_last_name1']),
      guardianFirstName2: row['guardian_first_name2'] != null
          ? Value(row['guardian_first_name2'])
          : const Value.absent(),
      guardianLastName2: row['guardian_last_name2'] != null
          ? Value(row['guardian_last_name2'])
          : const Value.absent(),
      guardianPhone1: Value(row['guardian_phone1']),
      guardianEmail1: Value(row['guardian_email1']),
      guardianPhone2: row['guardian_phone2'] != null
          ? Value(row['guardian_phone2'])
          : const Value.absent(),
      guardianEmail2: row['guardian_email2'] != null
          ? Value(row['guardian_email2'])
          : const Value.absent(),
      note: row['note'] != null ? Value(row['note']) : const Value.absent(),
      signUpFormStatusId: Value(row['sign_up_form_status_id']),
      schoolYearId: Value(row['school_year_id']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

TrainerStatusCompanion buildTrainerStatusCompanion(Map<String, dynamic> row) =>
    TrainerStatusCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

TrainerCompanion buildTrainerCompanion(Map<String, dynamic> row) =>
    TrainerCompanion(
      id: Value(row['id']),
      athleteId: Value(row['athlete_id']),
      trainerStatusId: Value(row['trainer_status_id']),
      qualification: Value(row['qualification']),
      salaryPerHour: Value(row['salary_per_hour']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

TrainingAthleteCompanion buildTrainingAthleteCompanion(
        Map<String, dynamic> row) =>
    TrainingAthleteCompanion(
      trainingId: Value(row['training_id']),
      athleteId: Value(row['athlete_id']),
      presence: Value(row['presence']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

TrainingTimeCompanion buildTrainingTimeCompanion(Map<String, dynamic> row) =>
    TrainingTimeCompanion(
      id: Value(row['id']),
      day: Value(row['day']),
      summerTime: Value(row['summer_time']),
      winterTime: Value(row['winter_time']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

TrainingTrainerCompanion buildTrainingTrainerCompanion(
        Map<String, dynamic> row) =>
    TrainingTrainerCompanion(
      trainingId: Value(row['training_id']),
      trainerId: Value(row['trainer_id']),
      presence: row['presence'] != null
          ? Value(row['presence'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

TrainingCompanion buildTrainingCompanion(Map<String, dynamic> row) =>
    TrainingCompanion(
      id: Value(row['id']),
      datetime: Value(DateTime.parse(row['datetime'])),
      groupId: Value(row['group_id']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      durationMinutes: Value(row['duration_minutes']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

WebPostCompanion buildWebPostCompanion(Map<String, dynamic> row) =>
    WebPostCompanion(
      id: Value(row['id']),
      title: Value(row['title']),
      content: Value(row['content']),
      trainerId: Value(row['trainer_id']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

final Map<String, Function> companionMap = {
  'app_settings': buildAppSettingCompanion,
  'sync_queue': buildSyncQueueCompanion,
  'athlete_guardian': buildAthleteGuardianCompanion,
  'athlete_meet_event': buildAthleteMeetEventCompanion,
  'athlete_sign_up_form': buildAthleteSignUpFormCompanion,
  'athlete_status': buildAthleteStatusCompanion,
  'athlete': buildAthleteCompanion,
  'category': buildCategoryCompanion,
  'club': buildClubCompanion,
  'discipline_type': buildDisciplineTypeCompanion,
  'discipline': buildDisciplineCompanion,
  'group_athlete': buildGroupAthleteCompanion,
  'group_trainer': buildGroupTrainerCompanion,
  'group': buildGroupCompanion,
  'guardian': buildGuardianCompanion,
  'item_type': buildItemTypeCompanion,
  'item': buildItemCompanion,
  'meet_event': buildMeetEventCompanion,
  'meet': buildMeetCompanion,
  'remote_config': buildRemoteConfigCompanion,
  'school_year': buildSchoolYearCompanion,
  'sign_up_form_status': buildSignUpFormStatusCompanion,
  'sign_up_form': buildSignUpFormCompanion,
  'trainer_status': buildTrainerStatusCompanion,
  'trainer': buildTrainerCompanion,
  'training_athlete': buildTrainingAthleteCompanion,
  'training_time': buildTrainingTimeCompanion,
  'training_trainer': buildTrainingTrainerCompanion,
  'training': buildTrainingCompanion,
  'web_post': buildWebPostCompanion,
};
