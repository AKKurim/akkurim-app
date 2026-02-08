import '../../services/database/drift_database.dart';
import './simple_athlete_view.dart';
import './trainer_view.dart';

class GroupView {
  GroupData group;
  List<SimpleAthleteView> athletes;
  List<TrainerView> trainers;
  SchoolYearData? schoolYear;

  GroupView({
    required this.group,
    required this.athletes,
    required this.trainers,
    this.schoolYear,
  });

  factory GroupView.empty({required TrainerView trainer}) {
    return GroupView(
      group: GroupData(
        id: '',
        name: '',
        schoolYearId: '',
        system: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        deletedAt: null,
      ),
      athletes: [],
      trainers: [trainer],
      schoolYear: null,
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
