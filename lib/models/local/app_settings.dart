import "package:drift/drift.dart";
import 'package:flutter/material.dart' as fm;
import '../../utils/config.dart';

class AppSetting extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get locale => text()();
  TextColumn get themeMode => text()();

  AppSettingsView toView() {
    return AppSettingsView(
      id: id as int,
      locale: fm.Locale(locale.toString()),
      themeData:
          themeMode.toString() == "dark" ? Config.darkTheme : Config.lightTheme,
    );
  }
}

class AppSettingsView {
  final int id;
  final fm.Locale locale;
  final fm.ThemeData themeData;

  AppSettingsView({
    required this.id,
    required this.locale,
    required this.themeData,
  });
}
