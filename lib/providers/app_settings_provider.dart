import '../services/database/drift_database.dart';
import '../config.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/views/app_settings_view.dart';
import 'package:drift/drift.dart';
import './db_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
    final storage = const FlutterSecureStorage();
    final useFingerprintRaw = await storage.read(key: "useFingerprint");
    final useFingerprint =
        useFingerprintRaw == null ? null : (useFingerprintRaw == 'true');

    yield* db.select(db.appSetting).watchSingle().map((event) {
      return AppSettingsView(
          id: event.id,
          locale: Locale(event.locale),
          themeData:
              event.themeMode == 'dark' ? Config.darkTheme : Config.lightTheme,
          useFingerprint: useFingerprint);
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

  Future<void> updateUseFingerprint(bool? useFingerprint) async {
    final storage = const FlutterSecureStorage();
    if (useFingerprint == null) {
      // if the user has not enabled fingerprint authentication, remove the key
      await storage.delete(key: "useFingerprint");
    } else {
      // save the useFingerprint value to secure storage
      await storage.write(
          key: "useFingerprint", value: useFingerprint.toString());
    }
    // refresh the state to reflect the change
    state = AsyncValue.data(
      state.value!.copyWith(useFingerprint: useFingerprint),
    );
  }
}
