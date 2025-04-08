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
  String get password => 'Password';

  @override
  String homeScreenTitle(String name) {
    return 'Welcome $name';
  }

  @override
  String get homeNavBar => 'Home';

  @override
  String get screen1Title => 'Screen 1';

  @override
  String get screen2Title => 'Screen 2';

  @override
  String get eventsScreenTitle => 'Events';

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
}
