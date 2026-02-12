import 'package:ak_kurim_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Config {
  bool get isDebug => kDebugMode;
  static const String baseUrl = kDebugMode
      //? 'http://192.168.0.9:8000'
      ? 'https://api.akkurim.cz'
      : 'https://api.akkurim.cz';
  static const String apiVersion = '/v1';

  static const String appName = 'Athletics Club Manager';
  static const String dbName = 'athletics_club_manager';

  static final Uri updateUri =
      Uri.parse('https://github.com/AKKurim/akkurim-app/releases');
  static final Uri bugReportUri =
      Uri.parse('https://github.com/AKKurim/akkurim-app/issues/new/choose');
  static Uri propositionUrl(String id) {
    return Uri.parse('https://online.atletika.cz/Propozice/propozice/$id');
  }

  static const String versionUrl =
      'https://api.github.com/repositories/609669246/releases/latest';

  static Uri resultsUrl(String id) {
    return Uri.parse('https://online.atletika.cz/vysledky/$id');
  }

  static Uri memberUri(String id, {String? year}) {
    year ??= DateTime.now().year.toString();
    return Uri.parse('https://online.atletika.cz/vysledky-atleta/$year/$id');
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
    DateTime(1993, 1, 1), // Nový rok
    DateTime(1993, 5, 1), // Svátek práce
    DateTime(1993, 5, 8), // Den vítězství
    DateTime(1993, 7, 5), // Cyril a Metoděj
    DateTime(1993, 7, 6), // Den upálení mistra Jana Husa
    DateTime(1993, 9, 28), // Den české státnosti
    DateTime(1993, 10, 28), // vznik československého státu
    DateTime(1993, 11, 17), // Den boje za svobodu a demokracii
    DateTime(1993, 12, 24), // Štědrý den
    DateTime(1993, 12, 25), // První svátek vánoční
    DateTime(1993, 12, 26), // Druhý svátek vánoční
  };

  static Set<DateTime> get getEasterHolidays {
    final Set<DateTime> easterHolidays = {};
    for (int year = DateTime.now().year - 3;
        year <= DateTime.now().year + 3;
        year++) {
      final DateTime easter = TimeHelper.getEasterSunday(year);
      easterHolidays.add(easter);
      easterHolidays
          .add(easter.add(const Duration(days: 1))); // Velikonoční pondělí
      easterHolidays
          .add(easter.subtract(const Duration(days: 2))); // Velký pátek
    }
    return easterHolidays;
  }
}
