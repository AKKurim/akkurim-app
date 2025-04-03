import 'package:ak_kurim_app/services/database/drift_database.dart';
import 'package:ak_kurim_app/utils/config.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/local/app_settings.dart';
import 'package:drift/drift.dart';
import '../providers/db_provider.dart';

part 'app_settings_provider.g.dart';

@riverpod
class AppSettingsP extends _$AppSettingsP {
  @override
  Stream<AppSettingsView> build() async* {
    final db = ref.read(dbProvider);
    await db.select(db.appSetting).getSingleOrNull() ??
        await db.into(db.appSetting).insert(
              AppSettingCompanion(
                id: Value(1),
                themeMode: Value('dark'),
                locale: Value('cs'),
              ),
              mode: InsertMode.insertOrReplace,
            );

    yield* db.select(db.appSetting).watchSingle().map((event) {
      return AppSettingsView(
          id: event.id,
          locale: Locale(event.locale),
          themeData:
              event.themeMode == 'dark' ? Config.darkTheme : Config.lightTheme);
    });
  }

  Future<void> updateThemeMode(String themeMode) async {
    final db = ref.read(dbProvider);
    await (db.update(db.appSetting)
          ..where(
            (tbl) => tbl.id.equals(state.value!.id),
          ))
        .write(
      AppSettingCompanion(
        themeMode: Value(themeMode),
      ),
    );
  }

  Future<void> updateLocale(String locale) async {
    final db = ref.read(dbProvider);
    await (db.update(db.appSetting)
          ..where(
            (tbl) => tbl.id.equals(state.value!.id),
          ))
        .write(
      AppSettingCompanion(
        locale: Value(locale),
      ),
    );
  }
}
