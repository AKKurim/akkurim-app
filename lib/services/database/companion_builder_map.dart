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
      type: Value(row['type']),
      data: row['data'] != null ? Value(row['data']) : const Value.absent(),
      doneAt:
          row['done_at'] != null ? Value(row['done_at']) : const Value.absent(),
      retryCount: Value(row['retry_count']),
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
      wind: row['wind'] != null ? Value(row['wind']) : const Value.absent(),
      pbSb: row['pb_sb'] != null ? Value(row['pb_sb']) : const Value.absent(),
      points:
          row['points'] != null ? Value(row['points']) : const Value.absent(),
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

AthleteCompanion buildAthleteCompanion(Map<String, dynamic> row) =>
    AthleteCompanion(
      id: Value(row['id']),
      bankNumber: row['bank_number'] != null
          ? Value(row['bank_number'])
          : const Value.absent(),
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
      profileImageId: row['profile_image_id'] != null
          ? Value(row['profile_picture'])
          : const Value.absent(),
      status: Value(row['status']),
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
      age: Value(row['age']),
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
      sort: Value(row['sort']),
      name: Value(row['name']),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      nameEn:
          row['name_en'] != null ? Value(row['name_en']) : const Value.absent(),
      descriptionEn: row['description_en'] != null
          ? Value(row['description_en'])
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
      traditional: Value(row['traditional']),
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
      system: Value(row['system']),
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
      bankNumber: row['bank_number'] != null
          ? Value(row['bank_number'])
          : const Value.absent(),
      firstName: Value(row['first_name']),
      lastName: Value(row['last_name']),
      email: Value(row['email']),
      phone: row['phone'] != null ? Value(row['phone']) : const Value.absent(),
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
      type: Value(row['type']),
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
      imageId: row['image_id'] != null
          ? Value(row['image_id'])
          : const Value.absent(),
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
      disciplineId: Value(row['discipline_id']),
      categoryId: Value(row['category_id']),
      startAt: Value(DateTime.parse(row['start_at'])),
      phase: row['phase'] != null ? Value(row['phase']) : const Value.absent(),
      count: row['count'] != null ? Value(row['count']) : const Value.absent(),
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
      type: Value(row['type']),
      externalId: row['external_id'] != null
          ? Value(row['external_id'])
          : const Value.absent(),
      name: Value(row['name']),
      startAt: Value(DateTime.parse(row['start_at'])),
      registrationStartAt: row['registration_start_at'] != null
          ? Value(DateTime.parse(row['registration_start_at']))
          : const Value.absent(),
      endAt: Value(DateTime.parse(row['end_at'])),
      registrationEndAt: row['registration_end_at'] != null
          ? Value(DateTime.parse(row['registration_end_at']))
          : const Value.absent(),
      registrationLimit: row['registration_limit'] != null
          ? Value(row['registration_limit'])
          : const Value.absent(),
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
      showFrom: Value(DateTime.parse(row['show_from'])),
      showTo: Value(DateTime.parse(row['show_to'])),
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
      status: Value(row['status']),
      schoolYearId: Value(row['school_year_id']),
      timesPerWeek: Value(row['times_per_week']),
      daysInWeek: Value(row['days_in_week']),
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
      bankNumber: row['bank_number'] != null
          ? Value(row['bank_number'])
          : const Value.absent(),
      status: Value(row['status']),
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
      durationSummer: Value(row['duration_summer']),
      durationWinter: Value(row['duration_winter']),
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
      startAt: Value(DateTime.parse(row['start_at'])),
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
      coverImageId: Value(row['cover_image_id']),
      content: Value(row['content']),
      trainerId: Value(row['trainer_id']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

AthleteRegistrationMeetEventCompanion
    buildAthleteRegistrationMeetEventCompanion(Map<String, dynamic> row) =>
        AthleteRegistrationMeetEventCompanion(
          athleteId: Value(row['athlete_id']),
          meetEventId: Value(row['meet_event_id']),
          status: Value(row['registration_status']),
          createdAt: Value(DateTime.parse(row['created_at'])),
          updatedAt: Value(DateTime.parse(row['updated_at'])),
          deletedAt: row['deleted_at'] != null
              ? Value(DateTime.parse(row['deleted_at']))
              : const Value.absent(),
        );

FileCompanion buildFileCompanion(Map<String, dynamic> row) => FileCompanion(
      id: Value(row['id']),
      name: Value(row['name']),
      type: Value(row['type']),
      size: Value(row['size']),
      mimeType: Value(row['mime_type']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

HelperCompanion buildHelperCompanion(Map<String, dynamic> row) =>
    HelperCompanion(
      id: Value(row['id']),
      status: Value(row['status']),
      bankNumber: row['bank_number'] != null
          ? Value(row['bank_number'])
          : const Value.absent(),
      firstName: Value(row['first_name']),
      lastName: Value(row['last_name']),
      dateOfBirth: row['date_of_birth'] != null
          ? Value(DateTime.parse(row['date_of_birth']))
          : const Value.absent(),
      email: Value(row['email']),
      phone: row['phone'] != null ? Value(row['phone']) : const Value.absent(),
      street:
          row['street'] != null ? Value(row['street']) : const Value.absent(),
      city: row['city'] != null ? Value(row['city']) : const Value.absent(),
      zip: row['zip'] != null ? Value(row['zip']) : const Value.absent(),
      qualification: row['qualification'] != null
          ? Value(row['qualification'])
          : const Value.absent(),
      preferrence: row['preferrence'] != null
          ? Value(row['preferrence'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

PaymentCompanion buildPaymentCompanion(Map<String, dynamic> row) =>
    PaymentCompanion(
      id: Value(row['id']),
      type: Value(row['type']),
      amount: Value(row['amount']),
      status: Value(row['status']),
      fromId:
          row['from_id'] != null ? Value(row['from_id']) : const Value.absent(),
      toId: row['to_id'] != null ? Value(row['to_id']) : const Value.absent(),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

PointsCompanion buildPointsCompanion(Map<String, dynamic> row) =>
    PointsCompanion(
      type: Value(row['type']),
      sourceId: Value(row['source_id']),
      amount: Value(row['amount']),
      athleteId: Value(row['athlete_id']),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

RequestFileCompanion buildRequestFileCompanion(Map<String, dynamic> row) =>
    RequestFileCompanion(
      requestId: Value(row['request_id']),
      fileId:
          row['file_id'] != null ? Value(row['file_id']) : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

RequestCompanion buildRequestCompanion(Map<String, dynamic> row) =>
    RequestCompanion(
      id: Value(row['id']),
      type: Value(row['type']),
      status: Value(row['status']),
      personId: row['person_id'] != null
          ? Value(row['person_id'])
          : const Value.absent(),
      itemId:
          row['item_id'] != null ? Value(row['item_id']) : const Value.absent(),
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

ResponseCompanion buildResponseCompanion(Map<String, dynamic> row) =>
    ResponseCompanion(
      id: Value(row['id']),
      requestId: Value(row['request_id']),
      personType: Value(row['person_type']),
      personId: row['person_id'] != null
          ? Value(row['person_id'])
          : const Value.absent(),
      fileId:
          row['file_id'] != null ? Value(row['file_id']) : const Value.absent(),
      description: row['description'] != null
          ? Value(row['description'])
          : const Value.absent(),
      createdAt: Value(DateTime.parse(row['created_at'])),
      updatedAt: Value(DateTime.parse(row['updated_at'])),
      deletedAt: row['deleted_at'] != null
          ? Value(DateTime.parse(row['deleted_at']))
          : const Value.absent(),
    );

SignUpFormGroupCompanion buildSignUpFormGroupCompanion(
        Map<String, dynamic> row) =>
    SignUpFormGroupCompanion(
      signUpFormId: Value(row['sign_up_form_id']),
      groupId: Value(row['group_id']),
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
  'athlete_registration_meet_event': buildAthleteRegistrationMeetEventCompanion,
  'athlete_sign_up_form': buildAthleteSignUpFormCompanion,
  'athlete': buildAthleteCompanion,
  'category': buildCategoryCompanion,
  'club': buildClubCompanion,
  'discipline_type': buildDisciplineTypeCompanion,
  'discipline': buildDisciplineCompanion,
  'file': buildFileCompanion,
  'group_athlete': buildGroupAthleteCompanion,
  'group_trainer': buildGroupTrainerCompanion,
  'group': buildGroupCompanion,
  'guardian': buildGuardianCompanion,
  'helper': buildHelperCompanion,
  'item_type': buildItemTypeCompanion,
  'item': buildItemCompanion,
  'meet_event': buildMeetEventCompanion,
  'meet': buildMeetCompanion,
  'payment': buildPaymentCompanion,
  'points': buildPointsCompanion,
  'remote_config': buildRemoteConfigCompanion,
  'request_file': buildRequestFileCompanion,
  'request': buildRequestCompanion,
  'response': buildResponseCompanion,
  'school_year': buildSchoolYearCompanion,
  'sign_up_form_group': buildSignUpFormGroupCompanion,
  'sign_up_form': buildSignUpFormCompanion,
  'trainer': buildTrainerCompanion,
  'training_athlete': buildTrainingAthleteCompanion,
  'training_time': buildTrainingTimeCompanion,
  'training_trainer': buildTrainingTrainerCompanion,
  'training': buildTrainingCompanion,
  'web_post': buildWebPostCompanion,
};
