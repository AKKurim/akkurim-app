import '../../services/database/drift_database.dart';
import './simple_athlete_view.dart';

class TrainerView {
  final TrainerData trainer;
  final TrainerStatusData trainerStatus;
  final SimpleAthleteView simpleAthlete;

  TrainerView({
    required this.trainer,
    required this.trainerStatus,
    required this.simpleAthlete,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TrainerView && trainer.athleteId == other.trainer.athleteId;
  }

  @override
  int get hashCode => trainer.athleteId.hashCode;
}
