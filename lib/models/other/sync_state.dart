import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_state.freezed.dart';

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
