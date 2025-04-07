import '../online_db/athlete.dart';
import '../online_db/club.dart';
import '../online_db/guardian.dart';
import '../online_db/athlete_status.dart';

class SimpleAthleteView {
  final Athlete athlete;
  final AthleteStatus athleteStatus;
  final Club club;
  final List<Guardian> guardians;

  SimpleAthleteView({
    required this.athlete,
    required this.athleteStatus,
    required this.club,
    required this.guardians,
  });
}
