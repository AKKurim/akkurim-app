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
  /// **'Storage'**
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

  /// The label for Monday
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// The label for Tuesday
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// The label for Wednesday
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// The label for Thursday
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// The label for Friday
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// The label for Saturday
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// The label for Sunday
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// The label for January
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// The label for February
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// The label for March
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// The label for April
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// The label for May
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// The label for June
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// The label for July
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// The label for August
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// The label for September
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// The label for October
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// The label for November
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// The label for December
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// The confirmation message for deleting an item
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {item}?'**
  String deleteItemConfirmation(String item);

  /// The label for the yes button
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// The label for the no button
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// The label for the first tab in the training screen
  ///
  /// In en, this message translates to:
  /// **'Trainings'**
  String get trainingTab1;

  /// The label for the second tab in the training screen
  ///
  /// In en, this message translates to:
  /// **'Groups'**
  String get trainingTab2;

  /// The label for the third tab in the training screen
  ///
  /// In en, this message translates to:
  /// **'T Results'**
  String get trainingTab3;

  /// The message shown when a user tries to perform an action they are not allowed to do
  ///
  /// In en, this message translates to:
  /// **'You are not allowed to do this action (not an admin)'**
  String get notAllowed;

  /// The message shown when login fails
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please check your credentials and network.'**
  String get loginFailed;

  /// The label for the group
  ///
  /// In en, this message translates to:
  /// **'Group'**
  String get group;

  /// The label for the add group button
  ///
  /// In en, this message translates to:
  /// **'Add Group'**
  String get addGroup;

  /// The message shown when a group is saved successfully
  ///
  /// In en, this message translates to:
  /// **'Group saved successfully.'**
  String get groupSaved;

  /// The label for the leave button
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get leave;

  /// The label for the stay button
  ///
  /// In en, this message translates to:
  /// **'Stay'**
  String get stay;

  /// The confirmation message for leaving a screen
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to leave?'**
  String get leaveConfirmation;

  /// The warning message shown when leaving a screen with unsaved changes
  ///
  /// In en, this message translates to:
  /// **'If you leave, you will lose all unsaved changes.'**
  String get leaveWarning;

  /// The label for the trainers in a group
  ///
  /// In en, this message translates to:
  /// **'Trainers in this Group'**
  String get trainersInGroup;

  /// The label for the athletes in a group
  ///
  /// In en, this message translates to:
  /// **'Athletes in this Group'**
  String get athletesInGroup;

  /// The message shown when a user tries to remove themselves from a group
  ///
  /// In en, this message translates to:
  /// **'You cannot remove yourself from the group.'**
  String get cannotRemoveSelf;

  /// The label for the user's groups
  ///
  /// In en, this message translates to:
  /// **'Your Groups'**
  String get yourGroups;

  /// The label for the delete group button
  ///
  /// In en, this message translates to:
  /// **'Delete Group'**
  String get deleteGroup;

  /// The confirmation message for deleting a group
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this group?'**
  String get deleteGroupConfirmation;

  /// The label for the cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// The label for the delete button
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// The label for the take attendance button
  ///
  /// In en, this message translates to:
  /// **'Take Attendance'**
  String get takeAttendance;

  /// The label for the content
  ///
  /// In en, this message translates to:
  /// **'Content: '**
  String get content;

  /// The hint text for the content input field
  ///
  /// In en, this message translates to:
  /// **'Enter content here...'**
  String get contentHint;

  /// The message shown when results are saved successfully
  ///
  /// In en, this message translates to:
  /// **'Results saved successfully.'**
  String get resultsSaved;

  /// The label for the delete training results button
  ///
  /// In en, this message translates to:
  /// **'Delete Training Results'**
  String get deleteTrainingResults;

  /// The confirmation message for deleting training results
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the training results?'**
  String get deleteTrainingResultsConfirmation;

  /// The label for the create training result button
  ///
  /// In en, this message translates to:
  /// **'Create Training Result'**
  String get createTrainingResult;

  /// The label for the name input field
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// The label for the select date button
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// The hint text for the discipline search input field
  ///
  /// In en, this message translates to:
  /// **'Search Discipline'**
  String get searchDiscipline;

  /// The label for the create button
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// The label for the delete training button
  ///
  /// In en, this message translates to:
  /// **'Delete Training'**
  String get deleteTraining;

  /// The confirmation message for deleting a training
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this training?'**
  String get deleteTrainingConfirmation;

  /// The label for the create training button
  ///
  /// In en, this message translates to:
  /// **'Create Training'**
  String get createTraining;

  /// The message shown when trainings are created successfully
  ///
  /// In en, this message translates to:
  /// **'Trainings created successfully.'**
  String get trainingsCreated;

  /// The message shown when the birth number is invalid
  ///
  /// In en, this message translates to:
  /// **'Invalid birth number'**
  String get invalidBirthNumber;

  /// The message shown when a member is saved successfully
  ///
  /// In en, this message translates to:
  /// **'Member saved successfully.'**
  String get memberSaved;

  /// The message shown when a member is deleted successfully
  ///
  /// In en, this message translates to:
  /// **'Member deleted successfully.'**
  String get memberDeleted;

  /// The confirmation message for deleting a member
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this member?'**
  String get deleteMemberConfirmation;

  /// The title for Contacts
  ///
  /// In en, this message translates to:
  /// **'Contacts:'**
  String get contacts;

  /// The message shown when the email is copied to clipboard
  ///
  /// In en, this message translates to:
  /// **'Email copied to clipboard.'**
  String get emailCopied;

  /// The message shown when the phone is copied to clipboard
  ///
  /// In en, this message translates to:
  /// **'Phone copied to clipboard.'**
  String get phoneCopied;

  /// The title for Guardian Contacts
  ///
  /// In en, this message translates to:
  /// **'Guardian Contacts:'**
  String get guardianContacts;

  /// The title for race tab 1
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get raceTab1;

  /// The title for race tab 2
  ///
  /// In en, this message translates to:
  /// **'Athletes'**
  String get raceTab2;

  /// The title for race tab 3
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get raceTab3;

  /// The label for the add item button
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get addItem;

  /// The label for the item name input field
  ///
  /// In en, this message translates to:
  /// **'Item Name'**
  String get itemName;

  /// The label for the description input field
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// The message shown when an item is created successfully
  ///
  /// In en, this message translates to:
  /// **'Item created successfully.'**
  String get itemCreate;

  /// The label for the item type
  ///
  /// In en, this message translates to:
  /// **'Item Type'**
  String get itemType;

  /// The label for the create item button
  ///
  /// In en, this message translates to:
  /// **'Create Item'**
  String get createItem;

  /// The label for the create item type button
  ///
  /// In en, this message translates to:
  /// **'Create Item Type'**
  String get createItemType;

  /// The message shown when an item type is created successfully
  ///
  /// In en, this message translates to:
  /// **'Item type created successfully.'**
  String get itemTypeCreated;

  /// The label for the new item type input field
  ///
  /// In en, this message translates to:
  /// **'New Item Type'**
  String get newItemType;

  /// The label for the add new item type button
  ///
  /// In en, this message translates to:
  /// **'Add New Item Type'**
  String get addNewItemType;

  /// The label for the save and close button
  ///
  /// In en, this message translates to:
  /// **'Save and Close'**
  String get saveAndClose;

  /// The label for assigning an item to a member
  ///
  /// In en, this message translates to:
  /// **'Assign {item} to:'**
  String assignItem(String item);

  /// The label for the central storage
  ///
  /// In en, this message translates to:
  /// **'Central Storage'**
  String get centralStorage;

  /// The label for selecting an athlete or storage
  ///
  /// In en, this message translates to:
  /// **'Select Athlete or Storage'**
  String get selectAthleteOrStorage;

  /// The message shown when an item is assigned successfully
  ///
  /// In en, this message translates to:
  /// **'Item assigned successfully.'**
  String get itemAssigned;

  /// The label for the next training
  ///
  /// In en, this message translates to:
  /// **'Next Training'**
  String get nextTraining;

  /// The label for the next race
  ///
  /// In en, this message translates to:
  /// **'Next Race'**
  String get nextRace;

  /// The message shown when there are no upcoming events
  ///
  /// In en, this message translates to:
  /// **'No upcoming events'**
  String get noUpcomingEvents;
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
