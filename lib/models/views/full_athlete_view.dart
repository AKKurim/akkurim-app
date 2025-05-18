import '../../services/database/drift_database.dart';
import '../../utils/utils.dart';

class FullAthleteView {
  final AthleteData athlete;
  final AthleteStatusData athleteStatus;
  final ClubData? club;
  final List<GuardianData> guardians;
  final List<AthleteMeetEventData> results;
  final List<AthleteSignUpFormData> signUpForms;

  FullAthleteView({
    required this.athlete,
    required this.athleteStatus,
    this.club,
    required this.guardians,
    required this.results,
    required this.signUpForms,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FullAthleteView && other.athlete.id == athlete.id;
  }

  @override
  int get hashCode => athlete.id.hashCode;

  String get fullName {
    return '${athlete.lastName} ${athlete.firstName}';
  }

  DateTime get birthDate {
    return Utils.parseBirthNumber(athlete.birthNumber);
  }
}
