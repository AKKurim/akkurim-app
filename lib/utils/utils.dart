import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class Utils {
  static bool ensureMinimumVersion(
      {required String currentVersion, required String minimumVersion}) {
    if (currentVersion.isEmpty || minimumVersion.isEmpty) {
      debugPrint('Current or minimum version is empty');
      return true;
    }
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
    // TODO check for daylight saving time
    switch (tz) {
      case 'UTC':
        return 'Z';
      case 'Europe/Prague':
        return '+01:00';
      case 'Europe/Berlin':
        return '+01:00';
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
    final adjustedYear =
        year < DateTime.now().year % 100 ? year + 2000 : year + 1900;
    final adjustedMonth = month > 12 ? month - 50 : month;

    return DateTime(adjustedYear, adjustedMonth, day);
  }

  static String camelToSnake(String text) {
    String val = text
        .replaceAllMapped(
            RegExp(r'([a-z])([A-Z])'), (Match m) => '${m[1]}_${m[2]}')
        .toLowerCase();
    if (val == 'datetime') {
      return 'datetime_';
    }
    return val;
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
      case 'active':
        return Colors.green;
      case 'pending':
        return Colors.yellow;
      case 'inactive':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  static Color getStatusBGColor(String status) {
    switch (status) {
      case 'active':
        return Colors.green.withValues(alpha: 0.2);
      case 'pending':
        return Colors.yellow.withValues(alpha: 0.2);
      case 'inactive':
        return Colors.red.withValues(alpha: 0.2);
      default:
        return Colors.grey.withValues(alpha: 0.2);
    }
  }

  static String getStatusName(String status, BuildContext context) {
    switch (status) {
      case 'active':
        return AppLocalizations.of(context)!.activeStatus;
      case 'pending':
        return AppLocalizations.of(context)!.pendingStatus;
      case 'inactive':
        return AppLocalizations.of(context)!.inactiveStatus;
      default:
        return AppLocalizations.of(context)!.archivedStatus;
    }
  }

  static String getDayName(String dayName, BuildContext context) {
    dayName = dayName.toLowerCase();
    switch (dayName) {
      case 'monday':
        return AppLocalizations.of(context)!.monday;
      case 'tuesday':
        return AppLocalizations.of(context)!.tuesday;
      case 'wednesday':
        return AppLocalizations.of(context)!.wednesday;
      case 'thursday':
        return AppLocalizations.of(context)!.thursday;
      case 'friday':
        return AppLocalizations.of(context)!.friday;
      case 'saturday':
        return AppLocalizations.of(context)!.saturday;
      case 'sunday':
        return AppLocalizations.of(context)!.sunday;
      default:
        return dayName;
    }
  }

  static String getMonthName(int monthNumber, BuildContext context) {
    switch (monthNumber) {
      case 1:
        return AppLocalizations.of(context)!.january;
      case 2:
        return AppLocalizations.of(context)!.february;
      case 3:
        return AppLocalizations.of(context)!.march;
      case 4:
        return AppLocalizations.of(context)!.april;
      case 5:
        return AppLocalizations.of(context)!.may;
      case 6:
        return AppLocalizations.of(context)!.june;
      case 7:
        return AppLocalizations.of(context)!.july;
      case 8:
        return AppLocalizations.of(context)!.august;
      case 9:
        return AppLocalizations.of(context)!.september;
      case 10:
        return AppLocalizations.of(context)!.october;
      case 11:
        return AppLocalizations.of(context)!.november;
      case 12:
        return AppLocalizations.of(context)!.december;
      default:
        throw Exception('Invalid month number: $monthNumber');
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

  static bool validateBirthNumber(String birthNumber) {
    if (birthNumber.length != 10) {
      return false;
    }

    final firstNineDigits = birthNumber.substring(0, 9);
    final checksum = int.parse(firstNineDigits);
    int mod = checksum % 11;
    if (mod == 10) {
      mod = 0;
    }
    final controlDigit = int.parse(birthNumber.substring(8, 9));
    return mod == controlDigit;
  }
}

class TimeHelper {
  final int hour;
  final int minute;
  final int seconds = 0; // Default value for seconds

  TimeHelper(this.hour, this.minute);

  factory TimeHelper.fromString(String time) {
    if (time.contains('+') || time.contains('-')) {
      time = time.split(RegExp(r'[+-]')).first;
    }

    final parts = time.split(':');
    if (parts.length != 2 && parts.length != 3) {
      print('Invalid time format: $time');
      throw FormatException('Invalid time format');
    }
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return TimeHelper(hour, minute);
  }

  @override
  String toString() {
    String hourString = hour.toString();
    String minuteString = minute.toString();
    String secondsString = seconds.toString();

    if (hour < 10) {
      hourString = '0$hour';
    }
    if (minute < 10) {
      minuteString = '0$minute';
    }
    if (seconds < 10) {
      secondsString = '0$seconds';
    }

    return '$hourString:$minuteString:$secondsString+0000';
  }

  static DateTime getStartOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 0, 0);
  }

  static DateTime getEndOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  static DateTime getStartOfWeek(DateTime date) {
    final startOfWeek = date.subtract(Duration(days: date.weekday - 1));
    return DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day, 0, 0);
  }

  static DateTime getEndOfWeek(DateTime date) {
    final endOfWeek =
        date.add(Duration(days: DateTime.daysPerWeek - date.weekday));
    return DateTime(endOfWeek.year, endOfWeek.month, endOfWeek.day, 23, 59, 59);
  }

  static DateTime getStartOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1, 0, 0);
  }

  static DateTime getEndOfMonth(DateTime date) {
    final nextMonth = date.month == 12 ? 1 : date.month + 1;
    final nextYear = date.month == 12 ? date.year + 1 : date.year;
    return DateTime(nextYear, nextMonth, 0, 23, 59, 59);
  }

  static String getMinHourFromDateTime(DateTime date) {
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  static String getDayMonthYear(DateTime date) {
    return '${date.day}. ${date.month}. ${date.year}';
  }

  static int getWeekDayFromString(String day) {
    switch (day.toLowerCase()) {
      case 'monday':
        return 1;
      case 'tuesday':
        return 2;
      case 'wednesday':
        return 3;
      case 'thursday':
        return 4;
      case 'friday':
        return 5;
      case 'saturday':
        return 6;
      case 'sunday':
        return 7;
      default:
        throw Exception('Invalid day: $day');
    }
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static String getWeekDayName(DateTime day, BuildContext context) {
    switch (day.weekday) {
      case 1:
        return AppLocalizations.of(context)!.monday;
      case 2:
        return AppLocalizations.of(context)!.tuesday;
      case 3:
        return AppLocalizations.of(context)!.wednesday;
      case 4:
        return AppLocalizations.of(context)!.thursday;
      case 5:
        return AppLocalizations.of(context)!.friday;
      case 6:
        return AppLocalizations.of(context)!.saturday;
      case 7:
        return AppLocalizations.of(context)!.sunday;
      default:
        throw Exception('Invalid weekday: ${day.weekday}');
    }
  }

  static String getFullDateWithTime(DateTime date, BuildContext context,
      {bool withDay = true, DateTime? endTime}) {
    return '${withDay ? getWeekDayName(date, context) : ''} ${getDayMonthYear(date)} (${getMinHourFromDateTime(date)}${endTime != null ? ' - ${getMinHourFromDateTime(endTime)}' : ''})';
  }

  static String getFullDateWithoutTime(
    DateTime date,
    BuildContext context,
  ) {
    return '${getWeekDayName(date, context)} ${getDayMonthYear(date)}';
  }

  static DateTime getEasterSunday(int year) {
    if (year < 1583) {
      throw ArgumentError('Year must be 1583 or later');
    }
    if (year > 2299) {
      throw ArgumentError('Year must be 2299 or earlier');
    }
    Map<int, List<int>> mnTable = {
      1599: [22, 2],
      1699: [22, 2],
      1799: [23, 3],
      1899: [23, 4],
      1999: [24, 5],
      2099: [24, 5],
      2199: [24, 6],
      2299: [25, 0],
    };
    // find m and n from the mnTable
    int m = 0;
    int n = 0;
    for (var entry in mnTable.entries) {
      if (year <= entry.key) {
        m = entry.value[0];
        n = entry.value[1];
        break;
      }
    }
    final int a = year % 19;
    final int b = year % 4;
    final int c = year % 7;
    final int d = (19 * a + m) % 30;
    final int e = (n + 2 * b + 4 * c + 6 * d) % 7;
    int day = 22 + d + e;
    int month = 3; // March
    if (day > 31) {
      day -= 31;
      month = 4; // April
    }
    // // Adjust for the Gregorian calendar reform
    // if (year >= 1583) {
    //   final int k = year ~/ 100;
    //   final int l = k ~/ 4;
    //   final int m1 = (k + 8) ~/ 25;
    //   final int n1 = (k - m1 + 1) ~/ 16;
    //   day -= (k + 19 * a + m1 - l - n1) % 30;
    //   if (day < 1) {
    //     day += 31; // Adjust for March
    //     month = 3; // March
    //   }
    // }
    return DateTime(year, month, day, 0, 0, 0, 0, 0);
  }

  static DateTime getEasterMonday(int year) {
    final easterSunday = getEasterSunday(year);
    return easterSunday.add(const Duration(days: 1));
  }

  static DateTime getBigFriday(int year) {
    final easterSunday = getEasterSunday(year);
    return easterSunday.subtract(const Duration(days: 2));
  }

  static DateTimeRange getSelectedWeekRange(DateTime selectedDate) {
    final startOfWeek = getStartOfWeek(selectedDate);
    final endOfWeek = getEndOfWeek(selectedDate);
    return DateTimeRange(start: startOfWeek, end: endOfWeek);
  }

  static DateTimeRange getSelectedMonthRange(DateTime selectedDate) {
    final startOfMonth = getStartOfMonth(selectedDate);
    final endOfMonth = getEndOfMonth(selectedDate);
    return DateTimeRange(
        start: getSelectedWeekRange(startOfMonth).start,
        end: getSelectedWeekRange(endOfMonth).end);
  }

  static DateTimeRange emptyRange() {
    return DateTimeRange(
      start: DateTime(1970, 1, 1),
      end: DateTime(1970, 1, 1),
    );
  }

  static bool isSummerTimeZone(DateTime date) {
    // In Czech Republic, summer time starts last Sunday in March and ends last Sunday in October
    final lastSundayInMarch = DateTime(date.year, 3, 31)
        .subtract(Duration(days: DateTime(date.year, 3, 31).weekday % 7));
    final lastSundayInOctober = DateTime(date.year, 10, 31)
        .subtract(Duration(days: DateTime(date.year, 10, 31).weekday % 7));
    return date.isAfter(lastSundayInMarch) &&
        date.isBefore(lastSundayInOctober);
  }
}
