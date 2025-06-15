import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Config {
  bool get isDebug => kDebugMode;
  static const String baseUrl =
      'https://${kDebugMode ? 'dev' : ''}api.akkurim.cz';
  static const String apiVersion = '/v1';

  static const String appName = 'Athletics Club Manager';
  static const String dbName = 'athletics_club_manager';

  static final Uri updateUrl =
      Uri.parse('https://github.com/AKKurim/akkurim-app/releases');
  static final Uri bugReportUrl =
      Uri.parse('https://github.com/AKKurim/akkurim-app/issues/new/choose');
  static Uri propositionUrl(String id) {
    return Uri.parse('https://online.atletika.cz/Propozice/propozice/$id');
  }

  static Uri resultsUrl(String id) {
    return Uri.parse('https://online.atletika.cz/vysledky/$id');
  }

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      secondary: Colors.green,
      brightness: Brightness.light,
    ),
    brightness: Brightness.light,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      secondary: Colors.green,
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,
  );

  static String defaultTheme = 'light';
  static const String defaultLocaleString = 'cs';

  static Set<DateTime> holidays = {
    DateTime(DateTime.now().year, 1, 1), // Nový rok
    DateTime(DateTime.now().year, 5, 1), // Svátek práce
    DateTime(DateTime.now().year, 5, 8), // Den vítězství
    DateTime(DateTime.now().year, 7, 5), // Cyril a Metoděj
    DateTime(DateTime.now().year, 7, 6), // Den upálení mistra Jana Husa
    DateTime(DateTime.now().year, 9, 28), // Den české státnosti
    DateTime(DateTime.now().year, 10, 28), // československého státu
    DateTime(DateTime.now().year, 11, 17), // Den boje za svobodu a demokracii
    DateTime(DateTime.now().year, 12, 24), // Štědrý den
    DateTime(DateTime.now().year, 12, 25), // První svátek vánoční
    DateTime(DateTime.now().year, 12, 26), // Druhý svátek vánoční
  };
}
