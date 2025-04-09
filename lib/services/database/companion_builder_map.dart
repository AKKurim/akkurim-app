import './drift_database.dart';
import 'package:drift/drift.dart';

// GENERATED COMPANION BUILDERS

AppSettingCompanion buildAppSettingCompanion(Map<String, dynamic> row) =>
    AppSettingCompanion(
      id: Value(row['id']),
      locale: Value(row['locale']),
      themeMode: Value(row['themeMode']),
    );

SyncQueueCompanion buildSyncQueueCompanion(Map<String, dynamic> row) =>
    SyncQueueCompanion(
      id: Value(row['id']),
      endpoint: Value(row['endpoint']),
      method: Value(row['method']),
      data: row['data'] != null ? Value(row['data']) : const Value.absent(),
      doneAt:
          row['doneAt'] != null ? Value(row['doneAt']) : const Value.absent(),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
    );

AthleteGuardianCompanion buildAthleteGuardianCompanion(
        Map<String, dynamic> row) =>
    AthleteGuardianCompanion(
      athleteId: Value(row['athleteId']),
      guardianId: Value(row['guardianId']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

AthleteMeetEventCompanion buildAthleteMeetEventCompanion(
        Map<String, dynamic> row) =>
    AthleteMeetEventCompanion(
      athleteId: Value(row['athleteId']),
      meetEventId: Value(row['meetEventId']),
      result:
          row['result'] != null ? Value(row['result']) : const Value.absent(),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

AthleteSignUpFormCompanion buildAthleteSignUpFormCompanion(
        Map<String, dynamic> row) =>
    AthleteSignUpFormCompanion(
      athleteId: Value(row['athleteId']),
      signUpFormId: Value(row['signUpFormId']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

AthleteStatusCompanion buildAthleteStatusCompanion(Map<String, dynamic> row) =>
    AthleteStatusCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

AthleteCompanion buildAthleteCompanion(Map<String, dynamic> row) =>
    AthleteCompanion(
      id: Value(row['id']),
      birthNumber: Value(row['birthNumber']),
      firstName: Value(row['firstName']),
      lastName: Value(row['lastName']),
      street: Value(row['street']),
      city: Value(row['city']),
      zip: Value(row['zip']),
      email: row['email'] != null ? Value(row['email']) : const Value.absent(),
      phone: row['phone'] != null ? Value(row['phone']) : const Value.absent(),
      ean: row['ean'] != null ? Value(row['ean']) : const Value.absent(),
      note: row['note'] != null ? Value(row['note']) : const Value.absent(),
      clubId:
          row['clubId'] != null ? Value(row['clubId']) : const Value.absent(),
      profilePicture: row['profilePicture'] != null
          ? Value(row['profilePicture'])
          : const Value.absent(),
      athleteStatusId: Value(row['athleteStatusId']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

CategoryCompanion buildCategoryCompanion(Map<String, dynamic> row) =>
    CategoryCompanion(
      id: Value(row['id']),
      sex: Value(row['sex']),
      description: Value(row['description']),
      shortDescription: Value(row['shortDescription']),
      descriptionEn: Value(row['descriptionEn']),
      shortDescriptionEn: Value(row['shortDescriptionEn']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
    );

ClubCompanion buildClubCompanion(Map<String, dynamic> row) => ClubCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: Value(row['description']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

DisciplineTypeCompanion buildDisciplineTypeCompanion(
        Map<String, dynamic> row) =>
    DisciplineTypeCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      nameEn:
          row['nameEn'] != null ? Value(row['nameEn']) : const Value.absent(),
      descriptionEn: row['descriptionEn'] != null
          ? Value(row['descriptionEn'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
    );

DisciplineCompanion buildDisciplineCompanion(Map<String, dynamic> row) =>
    DisciplineCompanion(
      id: Value(row['id']),
      disciplineTypeId: Value(row['disciplineTypeId']),
      description: Value(row['description']),
      shortDescription: Value(row['shortDescription']),
      descriptionEn: Value(row['descriptionEn']),
      shortDescriptionEn: Value(row['shortDescriptionEn']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
    );

GroupAthleteCompanion buildGroupAthleteCompanion(Map<String, dynamic> row) =>
    GroupAthleteCompanion(
      groupId: Value(row['groupId']),
      athleteId: Value(row['athleteId']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

GroupTrainerCompanion buildGroupTrainerCompanion(Map<String, dynamic> row) =>
    GroupTrainerCompanion(
      groupId: Value(row['groupId']),
      trainerId: Value(row['trainerId']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

GroupCompanion buildGroupCompanion(Map<String, dynamic> row) => GroupCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      trainingTimeId: Value(row['trainingTimeId']),
      schoolYearId: Value(row['schoolYearId']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

GuardianCompanion buildGuardianCompanion(Map<String, dynamic> row) =>
    GuardianCompanion(
      id: Value(row['id']),
      firstName: Value(row['firstName']),
      lastName: Value(row['lastName']),
      email: Value(row['email']),
      phone: Value(row['phone']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

ItemTypeCompanion buildItemTypeCompanion(Map<String, dynamic> row) =>
    ItemTypeCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

ItemCompanion buildItemCompanion(Map<String, dynamic> row) => ItemCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      image: row['image'] != null ? Value(row['image']) : const Value.absent(),
      count: Value(row['count']),
      itemTypeId: Value(row['itemTypeId']),
      athleteId: row['athleteId'] != null
          ? Value(row['athleteId'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

MeetEventCompanion buildMeetEventCompanion(Map<String, dynamic> row) =>
    MeetEventCompanion(
      id: Value(row['id']),
      meetId: Value(row['meetId']),
      meetType: Value(row['meetType']),
      disciplineId: Value(row['disciplineId']),
      categoryId: Value(row['categoryId']),
      startAt: Value(DateTime.parse(row['startAt'])),
      phase: row['phase'] != null ? Value(row['phase']) : const Value.absent(),
      createdAt: row['createdAt'] != null
          ? Value(row['createdAt'])
          : const Value.absent(),
      updatedAt: row['updatedAt'] != null
          ? Value(row['updatedAt'])
          : const Value.absent(),
      rowid: Value(row['rowid']),
    );

MeetCompanion buildMeetCompanion(Map<String, dynamic> row) => MeetCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      startAt: Value(DateTime.parse(row['startAt'])),
      endAt: Value(DateTime.parse(row['endAt'])),
      location: row['location'] != null
          ? Value(row['location'])
          : const Value.absent(),
      organizer: row['organizer'] != null
          ? Value(row['organizer'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

RemoteConfigCompanion buildRemoteConfigCompanion(Map<String, dynamic> row) =>
    RemoteConfigCompanion(
      id: Value(row['id']),
      urgentMessage: row['urgentMessage'] != null
          ? Value(row['urgentMessage'])
          : const Value.absent(),
      minimumAppVersion: Value(row['minimumAppVersion']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
    );

SchoolYearCompanion buildSchoolYearCompanion(Map<String, dynamic> row) =>
    SchoolYearCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

SignUpFormStatusCompanion buildSignUpFormStatusCompanion(
        Map<String, dynamic> row) =>
    SignUpFormStatusCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

SignUpFormCompanion buildSignUpFormCompanion(Map<String, dynamic> row) =>
    SignUpFormCompanion(
      id: Value(row['id']),
      birthNumber: Value(row['birthNumber']),
      firstName: Value(row['firstName']),
      lastName: Value(row['lastName']),
      street: Value(row['street']),
      city: Value(row['city']),
      zip: Value(row['zip']),
      email: row['email'] != null ? Value(row['email']) : const Value.absent(),
      phone: row['phone'] != null ? Value(row['phone']) : const Value.absent(),
      guardianFirstName1: Value(row['guardianFirstName1']),
      guardianLastName1: Value(row['guardianLastName1']),
      guardianFirstName2: row['guardianFirstName2'] != null
          ? Value(row['guardianFirstName2'])
          : const Value.absent(),
      guardianLastName2: row['guardianLastName2'] != null
          ? Value(row['guardianLastName2'])
          : const Value.absent(),
      guardianPhone1: Value(row['guardianPhone1']),
      guardianEmail1: Value(row['guardianEmail1']),
      guardianPhone2: row['guardianPhone2'] != null
          ? Value(row['guardianPhone2'])
          : const Value.absent(),
      guardianEmail2: row['guardianEmail2'] != null
          ? Value(row['guardianEmail2'])
          : const Value.absent(),
      note: row['note'] != null ? Value(row['note']) : const Value.absent(),
      signUpFormStatusId: Value(row['signUpFormStatusId']),
      schoolYearId: Value(row['schoolYearId']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

TrainerStatusCompanion buildTrainerStatusCompanion(Map<String, dynamic> row) =>
    TrainerStatusCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

TrainerCompanion buildTrainerCompanion(Map<String, dynamic> row) =>
    TrainerCompanion(
      id: Value(row['id']),
      athleteId: Value(row['athleteId']),
      trainerStatusId: Value(row['trainerStatusId']),
      qualification: Value(row['qualification']),
      salaryPerHour: Value(row['salaryPerHour']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

TrainingAthleteCompanion buildTrainingAthleteCompanion(
        Map<String, dynamic> row) =>
    TrainingAthleteCompanion(
      trainingId: Value(row['trainingId']),
      athleteId: Value(row['athleteId']),
      presence: Value(row['presence']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

TrainingTimeCompanion buildTrainingTimeCompanion(Map<String, dynamic> row) =>
    TrainingTimeCompanion(
      id: Value(row['id']),
      day: Value(row['day']),
      summerTime: Value(row['summerTime']),
      winterTime: Value(row['winterTime']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

TrainingTrainerCompanion buildTrainingTrainerCompanion(
        Map<String, dynamic> row) =>
    TrainingTrainerCompanion(
      trainingId: Value(row['trainingId']),
      trainerId: Value(row['trainerId']),
      presence: row['presence'] != null
          ? Value(row['presence'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

TrainingCompanion buildTrainingCompanion(Map<String, dynamic> row) =>
    TrainingCompanion(
      id: Value(row['id']),
      datetime: Value(DateTime.parse(row['datetime'])),
      groupId: Value(row['groupId']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      durationMinutes: Value(row['durationMinutes']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
    );

WebPostCompanion buildWebPostCompanion(Map<String, dynamic> row) =>
    WebPostCompanion(
      id: Value(row['id']),
      title: Value(row['title']),
      content: Value(row['content']),
      trainerId: Value(row['trainerId']),
      createdAt: Value(DateTime.parse(row['createdAt'])),
      updatedAt: Value(DateTime.parse(row['updatedAt'])),
      rowid: Value(row['rowid']),
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
