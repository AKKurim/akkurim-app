import '../../services/database/drift_database.dart';
import './simple_athlete_view.dart';

class MeetEventViewWithoutAthletes {
  MeetEventData meetEvent;
  DisciplineData? discipline;
  CategoryData? category;
  String? result;

  MeetEventViewWithoutAthletes({
    required this.meetEvent,
    this.discipline,
    this.category,
    this.result,
  });
}

class AthleteWithMeetEvents {
  SimpleAthleteView athlete;
  List<MeetEventViewWithoutAthletes> events;

  AthleteWithMeetEvents({
    required this.athlete,
    required this.events,
  });
}

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MeetEventView &&
        other.meetEvent == meetEvent &&
        other.discipline == discipline &&
        other.category == category;
  }

  @override
  int get hashCode {
    return meetEvent.hashCode ^ discipline.hashCode ^ category.hashCode;
  }
}
