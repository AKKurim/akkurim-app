import '../../services/database/drift_database.dart';
import '../views/group_view.dart';
import '../views/simple_athlete_view.dart';
import '../views/trainer_view.dart';

class TrainingView {
  final TrainingData training;
  GroupView group;
  Map<SimpleAthleteView, String> athleteAttendance;
  Map<TrainerView, String> trainerAttendance;

  TrainingView({
    required this.training,
    required this.group,
    required this.athleteAttendance,
    required this.trainerAttendance,
  });
}
