// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Athletics Club Management';

  @override
  String get confirmButton => 'Confirm';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirmation => 'Are you sure you want to log out?';

  @override
  String get language => 'Language';

  @override
  String get displayMode => 'Display mode';

  @override
  String get email => 'Email';

  @override
  String get phone => 'Phone';

  @override
  String get password => 'Password';

  @override
  String homeScreenTitle(String name) {
    return 'Welcome $name';
  }

  @override
  String get homeNavBar => 'Home';

  @override
  String get trainingScreenTitle => 'Training';

  @override
  String get screen2Title => 'Storage';

  @override
  String get eventsScreenTitle => 'Races';

  @override
  String membersScreenTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get membersNavBar => 'Members';

  @override
  String get settingsScreenTitle => 'Settings';

  @override
  String get addMember => 'Add Member';

  @override
  String get editMember => 'Edit Member';

  @override
  String get deleteMember => 'Delete Member';

  @override
  String get confirmDeleteMember =>
      'Are you sure you want to delete this member?';

  @override
  String get memberSearchHint => 'Search for a member';

  @override
  String get memberProfile => 'Member Profile';

  @override
  String get activeStatus => 'Active';

  @override
  String get inactiveStatus => 'Inactive';

  @override
  String get pendingStatus => 'Pending';

  @override
  String get archivedStatus => 'Archived';

  @override
  String get status => 'Status';

  @override
  String get trainer => 'Trainer';

  @override
  String get monday => 'Monday';

  @override
  String get tuesday => 'Tuesday';

  @override
  String get wednesday => 'Wednesday';

  @override
  String get thursday => 'Thursday';

  @override
  String get friday => 'Friday';

  @override
  String get saturday => 'Saturday';

  @override
  String get sunday => 'Sunday';

  @override
  String get january => 'January';

  @override
  String get february => 'February';

  @override
  String get march => 'March';

  @override
  String get april => 'April';

  @override
  String get may => 'May';

  @override
  String get june => 'June';

  @override
  String get july => 'July';

  @override
  String get august => 'August';

  @override
  String get september => 'September';

  @override
  String get october => 'October';

  @override
  String get november => 'November';

  @override
  String get december => 'December';

  @override
  String deleteItemConfirmation(String item) {
    return 'Are you sure you want to delete $item?';
  }

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get trainingTab1 => 'Trainings';

  @override
  String get trainingTab2 => 'Groups';

  @override
  String get trainingTab3 => 'T Results';

  @override
  String get notAllowed =>
      'You are not allowed to do this action (not an admin)';

  @override
  String get loginFailed =>
      'Login failed. Please check your credentials and network.';

  @override
  String get group => 'Group';

  @override
  String get addGroup => 'Add Group';

  @override
  String get groupSaved => 'Group saved successfully.';

  @override
  String get leave => 'Leave';

  @override
  String get stay => 'Stay';

  @override
  String get leaveConfirmation => 'Are you sure you want to leave?';

  @override
  String get leaveWarning => 'If you leave, you will lose all unsaved changes.';

  @override
  String get trainersInGroup => 'Trainers in this Group';

  @override
  String get athletesInGroup => 'Athletes in this Group';

  @override
  String get cannotRemoveSelf => 'You cannot remove yourself from the group.';

  @override
  String get yourGroups => 'Your Groups';

  @override
  String get deleteGroup => 'Delete Group';

  @override
  String get deleteGroupConfirmation =>
      'Are you sure you want to delete this group?';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get takeAttendance => 'Take Attendance';

  @override
  String get content => 'Content: ';

  @override
  String get contentHint => 'Enter content here...';

  @override
  String get resultsSaved => 'Results saved successfully.';

  @override
  String get deleteTrainingResults => 'Delete Training Results';

  @override
  String get deleteTrainingResultsConfirmation =>
      'Are you sure you want to delete the training results?';

  @override
  String get createTrainingResult => 'Create Training Result';

  @override
  String get name => 'Name';

  @override
  String get selectDate => 'Select Date';

  @override
  String get searchDiscipline => 'Search Discipline';

  @override
  String get create => 'Create';

  @override
  String get deleteTraining => 'Delete Training';

  @override
  String get deleteTrainingConfirmation =>
      'Are you sure you want to delete this training?';

  @override
  String get createTraining => 'Create Training';

  @override
  String get trainingsCreated => 'Trainings created successfully.';

  @override
  String get invalidBirthNumber => 'Invalid birth number';

  @override
  String get memberSaved => 'Member saved successfully.';

  @override
  String get memberDeleted => 'Member deleted successfully.';

  @override
  String get deleteMemberConfirmation =>
      'Are you sure you want to delete this member?';

  @override
  String get contacts => 'Contacts';

  @override
  String get emailCopied => 'Email copied to clipboard.';

  @override
  String get phoneCopied => 'Phone copied to clipboard.';

  @override
  String get guardianContacts => 'Guardian Contacts:';

  @override
  String get raceTab1 => 'Schedule';

  @override
  String get raceTab2 => 'Athletes';

  @override
  String get raceTab3 => 'Results';

  @override
  String get addItem => 'Add Item';

  @override
  String get itemName => 'Item Name';

  @override
  String get description => 'Description';

  @override
  String get itemCreate => 'Item created successfully.';

  @override
  String get itemType => 'Item Type';

  @override
  String get createItem => 'Create Item';

  @override
  String get createItemType => 'Create Item Type';

  @override
  String get itemTypeCreated => 'Item type created successfully.';

  @override
  String get newItemType => 'New Item Type';

  @override
  String get addNewItemType => 'Add New Item Type';

  @override
  String get saveAndClose => 'Save and Close';

  @override
  String assignItem(String item) {
    return 'Assign $item to:';
  }

  @override
  String get centralStorage => 'Central Storage';

  @override
  String get selectAthleteOrStorage => 'Select Athlete or Storage';

  @override
  String get itemAssigned => 'Item assigned successfully.';

  @override
  String get nextTraining => 'Next Training';

  @override
  String get nextRace => 'Next Race';

  @override
  String get noUpcomingEvents => 'No upcoming events';

  @override
  String get updateRequired => 'Update required';

  @override
  String currentVersion(String version) {
    return 'Current version: $version';
  }

  @override
  String minimumVersion(String version) {
    return 'Minimum version: $version';
  }

  @override
  String get downloadPage => 'Go to download page';

  @override
  String get newUpdateAvailable =>
      'New update available, please click to go to download page.';

  @override
  String get bugReport => 'Report a bug or request a feature';

  @override
  String get open => 'Open';

  @override
  String get signUpForms => 'Sign Up Forms';

  @override
  String get programme => 'Programme';

  @override
  String get results => 'Results';

  @override
  String get noResults => 'No results available';

  @override
  String get discipline => 'Discipline';

  @override
  String get result => 'Result';

  @override
  String get wind => 'Wind';

  @override
  String get points => 'Pts';

  @override
  String get showBirthdays => 'Show Birthdays';

  @override
  String get noEventsForSelectedDay => 'No events for: ';

  @override
  String get patchAvaliable => 'Patch available';

  @override
  String get patchDownloaded =>
      'Patch downloaded, please click here to restart the app to apply the changes.';

  @override
  String get restartNow => 'Restart Now';

  @override
  String get later => 'Later';

  @override
  String get atletikaCzProfile => 'Atletika.cz Profile';

  @override
  String get confirmDeleteItem => 'Are you sure you want to delete this item?';

  @override
  String get itemDeleted => 'Item deleted successfully.';
}
