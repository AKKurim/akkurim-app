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
  String get confirmDeleteMember => 'Are you sure you want to delete this member?';

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
}
