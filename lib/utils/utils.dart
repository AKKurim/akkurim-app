import 'package:flutter/foundation.dart';

class Utils {
  static bool ensureMinimumVersion(
      {required String currentVersion, required String minimumVersion}) {
    final currentVersionParts =
        currentVersion.split('.').map(int.parse).toList();
    final minimumVersionParts =
        minimumVersion.split('.').map(int.parse).toList();

    for (var i = 0; i < currentVersionParts.length; i++) {
      if (currentVersionParts[i] > minimumVersionParts[i]) {
        return true;
      } else if (currentVersionParts[i] < minimumVersionParts[i]) {
        return false;
      }
    }

    return true;
  }

  static bool debugPrint(String message) {
    if (kDebugMode) {
      print(message);
      return true;
    }
    return false;
  }

  static String tzOffsetMap(String tz) {
    print('tz: $tz');
    switch (tz) {
      case 'UTC':
        return 'Z';
      case 'Europe/Prague':
        return '+02:00';
      case 'Europe/Berlin':
        return '+02:00';
    }
    // TODO: Add more timezones from wiki
    return '+00:00';
  }
}
