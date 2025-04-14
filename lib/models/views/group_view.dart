import '../../services/database/drift_database.dart';
import './simple_athlete_view.dart';
import './trainer_view.dart';

class GroupView {
  GroupData group;
  List<SimpleAthleteView> athletes;
  List<TrainerView> trainers;
  SchoolYearData? schoolYear;
  TrainingTimeData? trainingTime;

  GroupView({
    required this.group,
    required this.athletes,
    required this.trainers,
    this.schoolYear,
    this.trainingTime,
  });

  factory GroupView.empty({required TrainerView trainer}) {
    return GroupView(
      group: GroupData(
        id: '',
        name: '',
        schoolYearId: '',
        trainingTimeId: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
      ),
      athletes: [],
      trainers: [trainer],
      schoolYear: null,
      trainingTime: null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GroupView && group.id == other.group.id;
  }

  @override
  int get hashCode => group.id.hashCode;
}
