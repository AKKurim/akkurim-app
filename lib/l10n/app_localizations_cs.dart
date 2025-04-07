// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Správa atletického klubu';

  @override
  String get confirmButton => 'Potvrdit';

  @override
  String get cancelButton => 'Zrušit';

  @override
  String get login => 'Přihlásit se';

  @override
  String get logout => 'Odhlášení';

  @override
  String get logoutConfirmation => 'Opravdu se chcete odhlásit?';

  @override
  String get language => 'Jazyk';

  @override
  String get displayMode => 'Režim zobrazení';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Heslo';

  @override
  String homeScreenTitle(String name) {
    return 'Vítejte $name';
  }

  @override
  String get homeNavBar => 'Domů';

  @override
  String get screen1Title => 'Obrazovka 1';

  @override
  String get screen2Title => 'Obrazovka 2';

  @override
  String get eventsScreenTitle => 'Akce';

  @override
  String membersScreenTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count členů',
      few: '$count členové',
      one: '$count člen',
    );
    return '$_temp0';
  }

  @override
  String get membersNavBar => 'Členové';

  @override
  String get settingsScreenTitle => 'Nastavení';

  @override
  String get addMember => 'Přidat člena';

  @override
  String get editMember => 'Upravit člena';

  @override
  String get deleteMember => 'Smazat člena';

  @override
  String get confirmDeleteMember => 'Opravdu chcete smazat tohoto člena?';
}
