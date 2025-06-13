import '../../services/database/drift_database.dart';
import './simple_athlete_view.dart';

class MeetEventViewWithoutAthletes {
  MeetEventData meetEvent;
  DisciplineData? discipline;
  CategoryData? category;
  String? result;
  String? wind;
  String? pbSb;
  String? points;

  MeetEventViewWithoutAthletes({
    required this.meetEvent,
    this.discipline,
    this.category,
    this.result,
    this.wind,
    this.pbSb,
    this.points,
  });
}

class AthleteWithMeetEvents {
  SimpleAthleteView athlete;
  List<MeetEventViewWithoutAthletes> events;

  AthleteWithMeetEvents({
    required this.athlete,
    required this.events,
  });

  bool isDoubleDiscipline(int disciplineId, {onlyCountResults = false}) {
    int count = 0;
    for (final event in events) {
      if (event.meetEvent.disciplineId == disciplineId &&
          (!onlyCountResults || event.result != null) &&
          event.meetEvent.deletedAt == null) {
        count++;
        if (count > 1) {
          return true;
        }
      }
    }
    return false;
  }
}

class MeetEventView {
  MeetEventData meetEvent;
  DisciplineData? discipline;
  CategoryData? category;
  Map<SimpleAthleteView, ResultView> athletesWithResults;

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

class ResultView {
  String? result;
  String? wind;
  String? pbSb;
  String? points;

  ResultView({
    this.result,
    this.wind,
    this.pbSb,
    this.points,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResultView &&
        other.result == result &&
        other.wind == wind &&
        other.pbSb == pbSb &&
        other.points == points;
  }

  @override
  int get hashCode {
    return result.hashCode ^ wind.hashCode ^ pbSb.hashCode ^ points.hashCode;
  }
}
