import "package:drift/drift.dart";
import '../../config.dart';
import 'package:flutter/material.dart' as fm;
import '../views/app_settings_view.dart';

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
