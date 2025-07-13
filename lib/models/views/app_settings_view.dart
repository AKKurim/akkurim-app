import 'package:flutter/material.dart' as fm;

class AppSettingsView {
  final int id;
  final fm.Locale locale;
  final fm.ThemeData themeData;
  final bool useMobileData = true;
  final bool? useFingerprint;

  AppSettingsView({
    required this.id,
    required this.locale,
    required this.themeData,
    this.useFingerprint,
  });

  // create copyWith method
  AppSettingsView copyWith({
    int? id,
    fm.Locale? locale,
    fm.ThemeData? themeData,
    bool? useFingerprint,
  }) {
    return AppSettingsView(
      id: id ?? this.id,
      locale: locale ?? this.locale,
      themeData: themeData ?? this.themeData,
      useFingerprint: useFingerprint ?? this.useFingerprint,
    );
  }
}
