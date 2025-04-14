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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SimpleAthleteView && other.athlete.id == athlete.id;
  }

  @override
  int get hashCode => athlete.id.hashCode;
}
