import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../utils/utils.dart';
import '../utils/config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:terminate_restart/terminate_restart.dart';

part 'new_update_provider.g.dart';

enum PatchStatus {
  idle,
  checking,
  downloaded,
  error,
}

@riverpod
Future<bool> newUpdate(Ref ref) async {
  Dio dio = Dio();
  Response response = await dio.get(Config.versionUrl).catchError((e) {
    return Response(
        data: {}, statusCode: 0, requestOptions: RequestOptions(path: ''));
  });

  if (response.statusCode != 200) {
    return false;
  }
  String latestVersion = response.data['tag_name'];
  latestVersion = latestVersion.substring(1);
  String currentVersion = (await PackageInfo.fromPlatform()).version;

  return !Utils.ensureMinimumVersion(
      currentVersion: currentVersion, minimumVersion: latestVersion);
}

@riverpod
class NewPatch extends _$NewPatch {
  final _shorebird = ShorebirdUpdater();

  @override
  Future<PatchStatus> build() async {
    try {
      final patchAvaliable = await _shorebird.checkForUpdate();
      if (patchAvaliable == UpdateStatus.outdated) {
        await _shorebird.update();
        return PatchStatus.downloaded;
      }
      if (patchAvaliable == UpdateStatus.restartRequired) {
        return PatchStatus.downloaded;
      }
      if (patchAvaliable == UpdateStatus.upToDate) {
        return PatchStatus.idle;
      }
    } catch (e) {
      return PatchStatus.error;
    }
    return PatchStatus.idle;
  }

  Future<void> restartApp() async {
    await TerminateRestart.instance.restartApp(
      options: const TerminateRestartOptions(
        terminate: true,
      ),
    );
  }

  void reset() {
    state = const AsyncValue<PatchStatus>.data(PatchStatus.idle);
  }
}
