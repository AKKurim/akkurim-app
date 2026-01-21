import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../services/database/drift_database.dart';
import 'package:drift/drift.dart';
import './db_provider.dart';
import '../services/network/sync_service.dart';
import '../services/auth/auth_service.dart';
import '../utils/utils.dart';
import 'dart:convert';

part 'guardian_provider.g.dart';

@riverpod
class GuardiansP extends _$GuardiansP {
  @override
  Stream<List<GuardianData>> build() async* {
    final db = ref.read(dbProvider);
    yield* (db.select(db.guardian)..where((t) => t.deletedAt.isNull())).watch();
  }

  Future<void> updateGuardian(
      {required String lastName,
      required String firstName,
      required String email,
      required String phone,
      String? id}) async {
    final db = ref.read(dbProvider);
    final sync = ref.read(syncServiceProvider.notifier);
    final id_ = id ?? const Uuid().v1();
    final auth = ref.read(authServiceProvider);

    final guard = await db.into(db.guardian).insertReturning(
          mode: InsertMode.insertOrReplace,
          GuardianCompanion(
            id: Value(id_),
            firstName: Value(firstName),
            lastName: Value(lastName),
            email: Value(email),
            phone: Value(phone),
            createdAt: Value(DateTime.now().toUtc()),
            updatedAt: Value(DateTime.now().toUtc()),
            lastUpdatedBy: Value(auth.asData!.value.email),
          ),
        );
    await sync.addToSyncQueue(
      '/sync/guardian',
      'post',
      jsonEncode(
        {
          'data': [Utils.convertMapKeysToSnakeCase(guard.toJson())],
          'primary_keys': ['id'],
          'table': 'guardian',
        },
      ),
    );
  }
}
