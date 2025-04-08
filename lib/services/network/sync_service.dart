import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dio/dio.dart';
import 'package:supertokens_flutter/dio.dart';
import 'package:eventflux/eventflux.dart';
import '../../providers/app_settings_provider.dart';
import '../../utils/config.dart';

part 'sync_service.g.dart';
part 'sync_service.freezed.dart';

@freezed
class SyncState with _$SyncState {
  const factory SyncState({
    required ConnectivityResult connectivityResult,
    required int toSync,
    required bool isUploading,
    required bool isDownloading,
    required DateTime lastSyncedAt,
  }) = _SyncState;
}

@riverpod
class SyncService extends _$SyncService {
  @override
  Future<SyncState> build() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final db = await ref.watch(databaseProvider.future);
    final remoteConfig = await ref.watch(remoteConfigProvider.future);
    final toSyncData = await db.rawQuery('SELECT COUNT(*) FROM sync_q');
    final toSync = Sqflite.firstIntValue(toSyncData) ?? 0;

    Connectivity().onConnectivityChanged.listen(
      (result) async {
        state = AsyncValue.data(
          state.value!.copyWith(
            connectivityResult: result.last,
          ),
        );
        _syncData(
            forceDownloadCheck:
                true); //force download on app start (provider creation)
      },
    );

    EventFlux.instance.connect(
        EventFluxConnectionType.get, "${Config.}/v1/sse/listen",
        onSuccessCallback: (EventFluxResponse? response) {
      response?.stream?.listen((event) {
        print("Event: $event");
        print("x" + event.data + "x");
        print(event);
      });
    });

    return SyncState(
      connectivityResult: connectivityResult.first,
      toSync: toSync,
      isUploading: false,
      isDownloading: false,
      lastSyncedAt:
          DateTime.now(), // TODO make sure to actually sync at app start
    );
  }

  // Future<void> _syncData({bool forceDownloadCheck = false}) async {
  //   // the forceDownloadCheck is used to force the download check on app start
  //   // otherwise we dont want to spam the server with requests
  //   // because the endpoint takes some time to only send what has changed
  //   // and we will be listening to server changes with websockets or server sent events
  //   print("Syncing data");
  //   if ((state.value!.toSync == 0 && !forceDownloadCheck) ||
  //       state.value!.isUploading ||
  //       state.value!.isDownloading ||
  //       state.value!.connectivityResult == ConnectivityResult.none) {
  //     print("Canceling sync");
  //     return;
  //   }
  //   final userSettings = await ref.watch(userSettingsServiceProvider.future);
  //   if (userSettings.useMobileData == false &&
  //       state.value!.connectivityResult == ConnectivityResult.mobile) {
  //     return;
  //   }

  //   state = AsyncValue.data(state.value!.copyWith(
  //     isUploading: true,
  //   ));

  //   final db = await ref.watch(databaseProvider.future);
  //   final remoteConfig = await ref.watch(remoteConfigProvider.future);
  //   final uploadData =
  //       await db.rawQuery('SELECT * FROM sync_q where type = ?', ['upload']);
  //   final Dio dio = Dio();
  //   dio.interceptors.add(SuperTokensInterceptorWrapper(client: dio));
  //   final serverUrl = remoteConfig.serverUrl;
  //   // TODO implement the getter for the server url or change the way the user can change the mode

  //   final futures = uploadData.map((data) async {
  //     try {
  //       final res = await dio
  //           .request(
  //             "$serverUrl${data['endpoint']}",
  //             data: data['data'],
  //             options: Options(method: data['method'] as String),
  //           )
  //           .timeout(const Duration(seconds: 5));
  //       // if an error occurs we just don't delete the item from the sync queue
  //       // and thus it will be retried on the next sync attempt TODO maybe change this so that we don't retry forever
  //       // maybe add a retry counter and delete the item after a certain number of retries?
  //       if (res.statusCode == 200 ||
  //           res.statusCode == 201 ||
  //           res.statusCode == 204) {
  //         return data['id'];
  //       }
  //     } catch (error) {
  //       print("Error: $error");
  //       // TODO maybe add a retry mechanism and actually handle the error
  //       return null;
  //     }
  //   }).toList();
  //   final result = await Future.wait(futures);
  //   final idsToDelete = result.whereType<int>().toList();
  //   if (idsToDelete.isNotEmpty) {
  //     await db.rawDelete(
  //       'DELETE FROM sync_q WHERE id IN (${idsToDelete.join(",")})',
  //     );
  //   }

  //   state = AsyncValue.data(state.value!.copyWith(
  //     toSync: state.value!.toSync - idsToDelete.length,
  //     isDownloading: true,
  //     isUploading: false,
  //   ));

  //   // TODO implement the download part here or somewhere else

  //   state = AsyncValue.data(state.value!.copyWith(
  //     isDownloading: false,
  //     lastSyncedAt: DateTime.now(),
  //   ));
  //   // we call this again to check if there are more items to sync which were added while we were syncing
  //   _syncData();
  // }

  // Future<void> addToSyncQueue(
  //     String endpoint, String method, String data, String type) async {
  //   final db = await ref.watch(databaseProvider.future);
  //   await db.rawInsert(
  //     'INSERT INTO sync_q (endpoint, method, data, type, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)',
  //     [
  //       endpoint,
  //       method,
  //       data,
  //       type,
  //       DateTime.now().toIso8601String(),
  //       DateTime.now().toIso8601String()
  //     ],
  //   );
  //   state =
  //       AsyncValue.data(state.value!.copyWith(toSync: state.value!.toSync + 1));
  //   _syncData();
  // }
}
