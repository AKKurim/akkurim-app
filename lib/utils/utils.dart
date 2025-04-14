import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

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
    switch (tz) {
      case 'UTC':
        return 'Z';
      case 'Europe/Prague':
        return '+02:00';
      case 'Europe/Berlin':
        return '+02:00';
    }
    // TODO: Add more timezones from wiki
    print('tz: $tz');
    return '+00:00';
  }

  static DateTime parseBirthNumber(String birthNumber) {
    final year = int.parse(birthNumber.substring(0, 2));
    final month = int.parse(birthNumber.substring(2, 4));
    final day = int.parse(birthNumber.substring(4, 6));

    // Adjust the year based on the month
    final adjustedYear = year < 30 ? year + 2000 : year + 1900;
    final adjustedMonth = month > 12 ? month - 50 : month;

    return DateTime(adjustedYear, adjustedMonth, day);
  }

  static String camelToSnake(String text) {
    return text
        .replaceAllMapped(
            RegExp(r'([a-z])([A-Z])'), (Match m) => '${m[1]}_${m[2]}')
        .toLowerCase();
  }

  static Map<String, dynamic> convertMapKeysToSnakeCase(
      Map<String, dynamic> inputMap) {
    Map<String, dynamic> result = {};
    inputMap.forEach((key, value) {
      result[camelToSnake(key)] = value;
    });
    return result;
  }

  static Color getStatusFGColor(String status) {
    switch (status) {
      case 'Active':
        return Colors.green;
      case 'Pending':
        return Colors.yellow;
      case 'Inactive':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  static Color getStatusBGColor(String status) {
    switch (status) {
      case 'Active':
        return Colors.green.withValues(alpha: 0.2);
      case 'Pending':
        return Colors.yellow.withValues(alpha: 0.2);
      case 'Inactive':
        return Colors.red.withValues(alpha: 0.2);
      default:
        return Colors.grey.withValues(alpha: 0.2);
    }
  }

  static String getStatusName(String status, BuildContext context) {
    switch (status) {
      case 'Active':
        return AppLocalizations.of(context)!.activeStatus;
      case 'Pending':
        return AppLocalizations.of(context)!.pendingStatus;
      case 'Inactive':
        return AppLocalizations.of(context)!.inactiveStatus;
      default:
        return AppLocalizations.of(context)!.archivedStatus;
    }
  }

  static String getCurrentSchoolYearString() {
    final now = DateTime.now();
    final year = now.year;
    final month = now.month;

    if (month >= 8) {
      return '$year/${year + 1}';
    } else {
      return '${year - 1}/$year';
    }
  }
}
