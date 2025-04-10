import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:eventflux/eventflux.dart';
import '../../providers/app_settings_provider.dart';
import '../../utils/config.dart';
import '../../providers/db_provider.dart';
import './api_service.dart';
import '../database/drift_database.dart';
import '../database/companion_builder_map.dart';
import '../../models/other/sync_state.dart';
import '../database/model_map.dart';
import '../../utils/utils.dart';
import 'package:drift/drift.dart';
import 'dart:convert';
import 'package:flutter_timezone/flutter_timezone.dart';

part 'sync_service.g.dart';

@riverpod
class SyncService extends _$SyncService {
  Future<int> _getToSyncCount() async {
    final db = ref.read(dbProvider);
    List<SyncQueueData> resCount = await (db.select(db.syncQueue)
          ..where(
            (tbl) => tbl.doneAt.isNull(),
          ))
        .get();
    return resCount.length;
  }

  ConnectivityResult _getConnectivityResult(List<ConnectivityResult> data) {
    if (data.contains(ConnectivityResult.wifi)) {
      return ConnectivityResult.wifi;
    }
    if (data.contains(ConnectivityResult.mobile)) {
      return ConnectivityResult.mobile;
    }
    return ConnectivityResult.none;
  }

  Future<void> _checkForUpdates() async {
    final db = ref.read(dbProvider);
    ApiService api = ApiService.instance;
    final lastUpdated = await _getLastUpdated();
    final netRes = await api
        .getRequest('${Config.apiVersion}/sync/tables/', queryParameters: {
      'from_date': lastUpdated,
    });
    await db.batch(
      (b) {
        b.insertAll(
          db.syncQueue,
          [
            for (var table in netRes.data)
              SyncQueueCompanion(
                endpoint: Value('/sync/$table'),
                method: Value('get'),
                data: Value(
                  json.encode(
                    {
                      'table_name': table,
                      'from_date': lastUpdated,
                    },
                  ),
                ),
                createdAt: Value(DateTime.now()),
                updatedAt: Value(DateTime.now()),
              ),
          ],
        );
      },
    );
  }

  @override
  Future<SyncState> build() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    Connectivity().onConnectivityChanged.listen(
      (result) async {
        final connRes = _getConnectivityResult(result);
        state = AsyncValue.data(
          state.value!.copyWith(
            connectivityResult: connRes,
          ),
        );
        if (_isConnected(connRes)) {
          _syncData(forceDownloadCheck: true);
        }
      },
    );
    EventFlux.instance.connect(
      EventFluxConnectionType.get,
      "${Config.baseUrl + Config.apiVersion}/sse/listen",
      onSuccessCallback: (EventFluxResponse? response) {
        response?.stream?.listen(
          (event) {
            // TODO handle event
            print("Event: $event");
            print("x" + event.data + "x");
            print(event);
            if (event.data.isNotEmpty) {
              _syncData(forceDownloadCheck: true);
            }
          },
        );
      },
    );

    final count = await _getToSyncCount();
    return SyncState(
      connectivityResult: connectivityResult.first,
      toSync: count,
      isUploading: false,
      isDownloading: false,
      lastSyncedAt: DateTime.now(),
    );
  }

  Future<String> _getLastUpdated() async {
    final db = ref.read(dbProvider);
    final resLastUpdated = await (db.select(db.syncQueue)
          ..orderBy([
            (u) => OrderingTerm(expression: u.doneAt, mode: OrderingMode.desc),
          ])
          ..where(
            (tbl) => tbl.doneAt.isNotNull(),
          )
          ..limit(1))
        .getSingleOrNull();
    String lastUpdated = "2025-01-01 00:00:00.000";
    if (resLastUpdated != null) {
      lastUpdated = resLastUpdated.doneAt.toString();
    }
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    lastUpdated += Utils.tzOffsetMap(
      currentTimeZone,
    );
    return lastUpdated;
  }

  bool _isConnected(ConnectivityResult result) {
    final appSettings = ref.watch(appSettingsPProvider);
    return result == ConnectivityResult.wifi ||
        (result == ConnectivityResult.mobile &&
            appSettings.whenData((data) {
                  return data.useMobileData;
                }).value ==
                true);
  }

  Future<void> _syncData({bool forceDownloadCheck = false}) async {
    if ((state.value!.toSync == 0 && !forceDownloadCheck) ||
        state.value!.isUploading ||
        state.value!.isDownloading ||
        state.value!.connectivityResult == ConnectivityResult.none) {
      return;
    }
    if (!_isConnected(state.value!.connectivityResult)) {
      return;
    }
    state = AsyncValue.data(state.value!.copyWith(
      isUploading: true,
    ));
    final db = ref.read(dbProvider);
    ApiService api = ApiService.instance;
    List uploadData = await (db.select(db.syncQueue)
          ..where(
            (tbl) => tbl.doneAt.isNull(),
          )
          ..where(
            (tbl) => tbl.method.isNotIn(['get']),
          ))
        .get();
    final uploadFutures = uploadData.map((data) async {
      try {
        final res = switch (data.method) {
          'post' => await api.postRequest(
              Config.apiVersion + data.endpoint,
              data: json.decode(data.data!) as Map<String, dynamic>,
            ),
          'put' => await api.putRequest(
              Config.apiVersion + data.endpoint,
              data: json.decode(data.data!) as Map<String, dynamic>,
            ),
          'delete' => await api.deleteRequest(
              Config.apiVersion + data.endpoint,
            ),
          _ => throw Exception('Unknown method' + data.method),
        };
        if (res.statusCode == 200 ||
            res.statusCode == 201 ||
            res.statusCode == 204) {
          return data.id;
        }
      } catch (error) {
        print("Error: $error");
        return null;
      }
    }).toList();

    final uploadResult = await Future.wait(uploadFutures);

    final idsToSetDone = uploadResult.whereType<int>().toList();
    if (idsToSetDone.isNotEmpty) {
      await (db.update(db.syncQueue)
            ..where(
              (tbl) => tbl.id.isIn(idsToSetDone),
            ))
          .write(
        SyncQueueCompanion(
          doneAt: Value(DateTime.now()),
        ),
      );
    }

    if (forceDownloadCheck) {
      await _checkForUpdates(); // checks for updates from server
      int count = await _getToSyncCount();
      state = AsyncValue.data(state.value!.copyWith(
        toSync: count,
        isDownloading: true,
        isUploading: false,
      ));

      final downloadData = await (db.select(db.syncQueue)
            ..where(
              (tbl) => tbl.doneAt.isNull(),
            )
            ..where(
              (tbl) => tbl.method.equals('get'),
            ))
          .get();
      final downloadFutures = downloadData.map((data) async {
        try {
          final res = await api.getRequest(
            "${Config.apiVersion}${data.endpoint}",
            queryParameters: json.decode(data.data!) as Map<String, dynamic>,
          );
          if (res.statusCode == 200) {
            return {
              'id': data.id,
              'data': res.data,
              'table': json.decode(data.data!)['table_name'],
            };
          }
        } catch (error) {
          print("Error: $error");
          return null;
        }
      }).toList();
      final downloadResult = await Future.wait(downloadFutures);
      for (final item in downloadResult) {
        try {
          if (item != null) {
            final data = item['data'] as List<dynamic>;
            final table = item['table'] as String;
            final id = item['id'] as int;
            await db.batch((b) {
              b.insertAll(
                modelMap[table] as TableInfo<Table, dynamic>,
                [
                  for (var item in data)
                    companionMap[table]!(item) as Insertable<dynamic>
                ],
                mode: InsertMode.insertOrReplace,
              );
            });
            await (db.update(db.syncQueue)
                  ..where(
                    (tbl) => tbl.id.equals(id),
                  ))
                .write(
              SyncQueueCompanion(
                doneAt: Value(DateTime.now()),
              ),
            );
          }
        } catch (error, stack) {
          print("Error: $error $stack");
        }
      }
    }

    int count = await _getToSyncCount();
    final lastUpdatedString = await _getLastUpdated();
    state = AsyncValue.data(state.value!.copyWith(
      isDownloading: false,
      lastSyncedAt: DateTime.parse(lastUpdatedString),
      toSync: count,
    ));
    _syncData();
  }

  Future<void> addToSyncQueue(String endpoint, String method, String data,
      {bool sync = true}) async {
    final db = ref.watch(dbProvider);
    await db.into(db.syncQueue).insert(
          SyncQueueCompanion(
            endpoint: Value(endpoint),
            method: Value(method),
            data: Value(data),
            createdAt: Value(DateTime.now()),
            updatedAt: Value(DateTime.now()),
          ),
        );
    state =
        AsyncValue.data(state.value!.copyWith(toSync: state.value!.toSync + 1));
    if (sync) {
      _syncData();
    }
  }
}
