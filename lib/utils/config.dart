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
}
