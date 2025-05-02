import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/database/drift_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './db_provider.dart';
import 'package:drift/drift.dart';

part 'remote_config_provider.g.dart';

@riverpod
Stream<RemoteConfigData> remoteConfig(Ref ref) async* {
  final db = ref.read(dbProvider);
  await db.select(db.remoteConfig).getSingleOrNull() ??
      await db.into(db.remoteConfig).insert(
            RemoteConfigCompanion(
              id: Value(0),
              urgentMessage: Value(''),
              minimumAppVersion: Value('2.0.0'),
              createdAt: Value(DateTime.now().toUtc()),
              updatedAt: Value(DateTime.now().toUtc()),
              deletedAt: Value(null),
            ),
            mode: InsertMode.insertOrReplace,
          );
  yield* db.select(db.remoteConfig).watchSingle();
}
