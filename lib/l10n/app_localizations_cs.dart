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
  String get phone => 'Telefon';

  @override
  String get password => 'Heslo';

  @override
  String homeScreenTitle(String name) {
    return 'Vítejte $name';
  }

  @override
  String get homeNavBar => 'Domů';

  @override
  String get trainingScreenTitle => 'Trénink';

  @override
  String get screen2Title => 'Sklad';

  @override
  String get eventsScreenTitle => 'Závody';

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

  @override
  String get memberSearchHint => 'Hledat členy';

  @override
  String get memberProfile => 'Profil člena';

  @override
  String get activeStatus => 'Aktivní';

  @override
  String get inactiveStatus => 'Neaktivní';

  @override
  String get pendingStatus => 'Čekající';

  @override
  String get archivedStatus => 'Archivován';

  @override
  String get status => 'Stav';

  @override
  String get trainer => 'Trenér';

  @override
  String get monday => 'Pondělí';

  @override
  String get tuesday => 'Úterý';

  @override
  String get wednesday => 'Středa';

  @override
  String get thursday => 'Čtvrtek';

  @override
  String get friday => 'Pátek';

  @override
  String get saturday => 'Sobota';

  @override
  String get sunday => 'Neděle';

  @override
  String get january => 'Leden';

  @override
  String get february => 'Únor';

  @override
  String get march => 'Březen';

  @override
  String get april => 'Duben';

  @override
  String get may => 'Květen';

  @override
  String get june => 'Červen';

  @override
  String get july => 'Červenec';

  @override
  String get august => 'Srpen';

  @override
  String get september => 'Září';

  @override
  String get october => 'Říjen';

  @override
  String get november => 'Listopad';

  @override
  String get december => 'Prosinec';

  @override
  String deleteItemConfirmation(String item) {
    return 'Opravdu chcete smazat $item?';
  }

  @override
  String get yes => 'Ano';

  @override
  String get no => 'Ne';
}
