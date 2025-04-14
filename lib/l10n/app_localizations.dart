import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('en')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Athletics Club Management'**
  String get appTitle;

  /// The label for the confirm button
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmButton;

  /// The label for the cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// The label for the login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// The label for the logout dialog
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// The confirmation message for logging out
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmation;

  /// The label for the language selection
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// The label for the display mode selection (light or dark)
  ///
  /// In en, this message translates to:
  /// **'Display mode'**
  String get displayMode;

  /// The label for the email input field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// The label for the phone input field
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// The label for the password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// The welcome message on the home screen
  ///
  /// In en, this message translates to:
  /// **'Welcome {name}'**
  String homeScreenTitle(String name);

  /// The label for the home navigation bar
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeNavBar;

  /// The title of screen 1
  ///
  /// In en, this message translates to:
  /// **'Training'**
  String get trainingScreenTitle;

  /// The title of screen 2
  ///
  /// In en, this message translates to:
  /// **'Screen 2'**
  String get screen2Title;

  /// The title of the events screen
  ///
  /// In en, this message translates to:
  /// **'Races'**
  String get eventsScreenTitle;

  /// The label for the members screen
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 member} other{{count} members}}'**
  String membersScreenTitle(int count);

  /// The label for the members navigation bar
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get membersNavBar;

  /// The title of the settings screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsScreenTitle;

  /// The label for the add member button
  ///
  /// In en, this message translates to:
  /// **'Add Member'**
  String get addMember;

  /// The label for the edit member button
  ///
  /// In en, this message translates to:
  /// **'Edit Member'**
  String get editMember;

  /// The label for the delete member button
  ///
  /// In en, this message translates to:
  /// **'Delete Member'**
  String get deleteMember;

  /// The confirmation message for deleting a member
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this member?'**
  String get confirmDeleteMember;

  /// The hint text for the member search input field
  ///
  /// In en, this message translates to:
  /// **'Search for a member'**
  String get memberSearchHint;

  /// The title of the member profile screen
  ///
  /// In en, this message translates to:
  /// **'Member Profile'**
  String get memberProfile;

  /// The label for the active status
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeStatus;

  /// The label for the inactive status
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactiveStatus;

  /// The label for the pending status
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pendingStatus;

  /// The label for the archived status
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get archivedStatus;

  /// The label for the status
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// The label for the trainer
  ///
  /// In en, this message translates to:
  /// **'Trainer'**
  String get trainer;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['cs', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs': return AppLocalizationsCs();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
