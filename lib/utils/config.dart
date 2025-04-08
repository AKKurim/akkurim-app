import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Config {
  static const String baseUrl =
      'https://${kDebugMode ? 'dev' : ''}api.akkurim.cz';

  static const String appName = 'Athletics Club Manager';
  static const String dbName = 'athletics_club_manager';

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
