import '../../services/database/drift_database.dart';
import './simple_athlete_view.dart';

class MeetEventView {
  MeetEventData meetEvent;
  DisciplineData? discipline;
  CategoryData? category;
  Map<SimpleAthleteView, String> athletesWithResults;

  MeetEventView({
    required this.meetEvent,
    this.discipline,
    this.category,
    required this.athletesWithResults,
  });
}
