import '../../services/database/drift_database.dart';
import '../../utils/utils.dart';

class SimpleAthleteView {
  final AthleteData athlete;
  final AthleteStatusData athleteStatus;
  final ClubData? club;

  SimpleAthleteView({
    required this.athlete,
    required this.athleteStatus,
    this.club,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SimpleAthleteView && other.athlete.id == athlete.id;
  }

  @override
  int get hashCode => athlete.id.hashCode;

  String get fullName {
    return '${athlete.lastName} ${athlete.firstName}';
  }

  DateTime get birthDate {
    return Utils.parseBirthNumber(athlete.birthNumber);
  }

  DateTime birthDay(int year) {
    final birthDate = this.birthDate;
    return DateTime(year, birthDate.month, birthDate.day);
  }
}
