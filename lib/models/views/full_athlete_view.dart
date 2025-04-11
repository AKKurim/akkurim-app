import '../../services/database/drift_database.dart';

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
}
