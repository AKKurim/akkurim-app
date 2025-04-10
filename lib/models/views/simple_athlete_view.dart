import '../../services/database/drift_database.dart';

class SimpleAthleteView {
  final AthleteData athlete;
  final AthleteStatusData athleteStatus;
  final ClubData? club;

  SimpleAthleteView({
    required this.athlete,
    required this.athleteStatus,
    this.club,
  });
}
