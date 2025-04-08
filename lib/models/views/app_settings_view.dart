import 'package:flutter/material.dart' as fm;

class AppSettingsView {
  final int id;
  final fm.Locale locale;
  final fm.ThemeData themeData;
  final bool useMobileData = true;

  AppSettingsView({
    required this.id,
    required this.locale,
    required this.themeData,
  });
}
