// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'AK Kuřim';

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

  @override
  String get trainingTab1 => 'Tréninky';

  @override
  String get trainingTab2 => 'Skupiny';

  @override
  String get trainingTab3 => 'T Výsledky';

  @override
  String get notAllowed => 'Nemáte oprávnění k této akci. (nejste admin)';

  @override
  String get loginFailed =>
      'Přihlášení se nezdařilo. Zkontrolujte své přihlašovací údaje a zkuste to znovu.';

  @override
  String get group => 'Skupina';

  @override
  String get addGroup => 'Přidat skupinu';

  @override
  String get groupSaved => 'Skupina byla úspěšně uložena';

  @override
  String get leave => 'Odejít';

  @override
  String get stay => 'Zůstat';

  @override
  String get leaveConfirmation => 'Opravdu chcete odejít?';

  @override
  String get leaveWarning =>
      'Pokud odejdete, přijdete o všechny neuložené změny.';

  @override
  String get trainersInGroup => 'Trenéři ve skupině';

  @override
  String get athletesInGroup => 'Atleti ve skupině';

  @override
  String get cannotRemoveSelf => 'Nemůžete se odstranit ze skupiny.';

  @override
  String get yourGroups => 'Vaše skupiny';

  @override
  String get deleteGroup => 'Smazat skupinu';

  @override
  String get deleteGroupConfirmation => 'Opravdu chcete smazat tuto skupinu?';

  @override
  String get cancel => 'Zrušit';

  @override
  String get delete => 'Smazat';

  @override
  String get takeAttendance => 'Zapsat docházku';

  @override
  String get content => 'Obsah: ';

  @override
  String get contentHint => 'Zapište obsah tréninku';

  @override
  String get resultsSaved => 'Výsledky byly úspěšně uloženy.';

  @override
  String get deleteTrainingResults => 'Smazat výsledky tréninku';

  @override
  String get deleteTrainingResultsConfirmation =>
      'Opravdu chcete smazat výsledky tréninku?';

  @override
  String get createTrainingResult => 'Vytvořit výsledek tréninku';

  @override
  String get name => 'Jméno';

  @override
  String get selectDate => 'Vyberte datum';

  @override
  String get searchDiscipline => 'Hledat disciplínu';

  @override
  String get create => 'Vytvořit';

  @override
  String get deleteTraining => 'Smazat trénink';

  @override
  String get deleteTrainingConfirmation =>
      'Opravdu chcete smazat tento trénink?';

  @override
  String get createTraining => 'Vytvořit trénink';

  @override
  String get trainingsCreated => 'Tréninky byly úspěšně vytvořeny.';

  @override
  String get invalidBirthNumber => 'Neplatné rodné číslo.';

  @override
  String get memberSaved => 'Člen byl úspěšně uložen.';

  @override
  String get memberDeleted => 'Člen byl úspěšně smazán.';

  @override
  String get deleteMemberConfirmation => 'Opravdu chcete smazat tohoto člena?';

  @override
  String get contacts => 'Kontakty';

  @override
  String get emailCopied => 'E-mail zkopírován do schránky.';

  @override
  String get phoneCopied => 'Telefon zkopírován do schránky.';

  @override
  String get guardianContacts => 'Kontakty zástupců:';

  @override
  String get raceTab1 => 'Časák';

  @override
  String get raceTab2 => 'Přihlášení';

  @override
  String get raceTab3 => 'Výsledky';

  @override
  String get addItem => 'Přidat položku';

  @override
  String get itemName => 'Název položky';

  @override
  String get description => 'Popis';

  @override
  String get itemCreate => 'Položka vytvořena úspěšně.';

  @override
  String get itemType => 'Typ položky';

  @override
  String get createItem => 'Vytvořit položku';

  @override
  String get createItemType => 'Vytvořit typ položky';

  @override
  String get itemTypeCreated => 'Typ položky vytvořen úspěšně.';

  @override
  String get newItemType => 'Nový typ položky';

  @override
  String get addNewItemType => 'Přidat nový typ položky';

  @override
  String get saveAndClose => 'Uložit a zavřít';

  @override
  String assignItem(String item) {
    return 'Přiřazení $item:';
  }

  @override
  String get centralStorage => 'Centrální sklad';

  @override
  String get selectAthleteOrStorage => 'Vyberte člena nebo sklad';

  @override
  String get itemAssigned => 'Položka byla úspěšně přiřazena.';

  @override
  String get nextTraining => 'Příští trénink';

  @override
  String get nextRace => 'Příští závod';

  @override
  String get noUpcomingEvents => 'Žádné nadcházející události';

  @override
  String get updateRequired => 'Je nutné aktualizovat aplikaci.';

  @override
  String currentVersion(String version) {
    return 'Aktuální verze: $version';
  }

  @override
  String minimumVersion(String version) {
    return 'Minimální nutná verze: $version';
  }

  @override
  String get downloadPage => 'Přejít na stránku pro stažení';

  @override
  String get newUpdateAvailable =>
      'Nová aktualizace je k dispozici. Klikněte pro stažení nejnovější verze.';

  @override
  String get bugReport => 'Nahlásit chybu nebo návrh na vylepšení';

  @override
  String get open => 'Otevřít';

  @override
  String get signUpForms => 'Přihlášky';

  @override
  String get programme => 'Propozice';

  @override
  String get results => 'Výsledky';

  @override
  String get noResults => 'Výsledky nenalezeny';

  @override
  String get discipline => 'Disciplína';

  @override
  String get result => 'Výkon';

  @override
  String get wind => 'Vítr';

  @override
  String get points => 'Body';

  @override
  String get showBirthdays => 'Zobrazit narozeniny';

  @override
  String get noEventsForSelectedDay => 'Žádné události dne: ';

  @override
  String get patchAvaliable => 'Vylepšení k dispozici';

  @override
  String get patchDownloaded =>
      'Stáhlo se vylepšení, které opravuje chyby a přidává nové funkce. Prosím klikněte zde pro restartování aplikace a načtení vylepšení.';

  @override
  String get restartNow => 'Restartovat nyní';

  @override
  String get later => 'Později';

  @override
  String get atletikaCzProfile => 'Profil Atletika.cz';

  @override
  String get confirmDeleteItem => 'Opravdu chcete smazat tuto položku?';

  @override
  String get itemDeleted => 'Položka byla úspěšně smazána.';

  @override
  String get saveFingerprintLogin =>
      'Chcete použít přihlášení pomocí otisku prstu?';

  @override
  String get useFingerprintAndroid =>
      'Pokud ano, přiložte prst na snímač otisků prstů';

  @override
  String get loginWithFingerprint => 'Pro přihlášení použijte otisk prstu';

  @override
  String get loginWithFingerprintAndroid =>
      'Přiložte prst na snímač otisků prstů';

  @override
  String get useFingerprintSettings => 'Přihlášení pomocí';

  @override
  String get notImplemented => 'Tato funkce ještě není implementována.';

  @override
  String get register => 'Registrace';

  @override
  String get registerButton => 'Registrovat';

  @override
  String get registerFailed =>
      'Registrace se nezdařila. Zkontrolujte své údaje a síťové připojení.';

  @override
  String get passwordsDoNotMatch => 'Hesla se neshodují.';

  @override
  String get loginScreenTitle => 'Přihlášení';

  @override
  String get editGroup => 'Upravit skupinu';
}
