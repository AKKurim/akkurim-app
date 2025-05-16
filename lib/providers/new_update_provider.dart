import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'new_update_provider.g.dart';

@riverpod
Future<bool> newUpdate(Ref ref) async {
  final String versionUrl =
      'https://api.github.com/repositories/609669246/releases/latest';
  Dio dio = Dio();
  Response response = await dio.get(versionUrl).catchError((e) {
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
