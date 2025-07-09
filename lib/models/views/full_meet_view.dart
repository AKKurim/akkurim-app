import 'package:ak_kurim_app/models/views/simple_athlete_view.dart';

import '../../services/database/drift_database.dart';
import './meet_event_view.dart';
import '../../utils/utils.dart';

class FullMeetView {
  MeetData meet;
  List<MeetEventView> events;

  FullMeetView({
    required this.meet,
    required this.events,
  });

  bool get isPast {
    return meet.endAt.add(const Duration(minutes: 90)).isBefore(DateTime.now());
  }

  bool get isToday {
    final now = DateTime.now();
    return TimeHelper.isSameDay(
          meet.startAt,
          now,
        ) ||
        (isMultiDay &&
            meet.endAt.add(const Duration(minutes: 89)).isAfter(now) &&
            meet.startAt.isBefore(now));
  }

  bool get isMultiDay {
    return meet.startAt.difference(meet.endAt).inDays < 0;
  }

  bool isDoubleMeetDiscipline(int disciplineId, int categoryID) {
    int count = 0;
    for (final event in events) {
      if (event.meetEvent.disciplineId == disciplineId &&
          event.meetEvent.categoryId == categoryID) {
        count++;
        if (count > 1) {
          return true;
        }
      }
    }
    return false;
  }

  int get athletesCount {
    final athletes = events
        .expand((event) => event.athletesWithResults.keys)
        .toSet()
        .toList();
    return athletes.length;
  }

  List<AthleteWithMeetEvents> get athletesWithEvents {
    final Map<SimpleAthleteView, List<MeetEventViewWithoutAthletes>>
        athletesMap = {};

    for (final event in events) {
      for (final athlete in event.athletesWithResults.keys) {
        if (!athletesMap.containsKey(athlete)) {
          athletesMap[athlete] = [];
        }
        athletesMap[athlete]!.add(MeetEventViewWithoutAthletes(
          meetEvent: event.meetEvent,
          discipline: event.discipline,
          category: event.category,
          result: event.athletesWithResults[athlete]?.result,
          wind: event.athletesWithResults[athlete]?.wind,
          pbSb: event.athletesWithResults[athlete]?.pbSb,
          points: event.athletesWithResults[athlete]?.points,
        ));
      }
    }

    return athletesMap.entries
        .map((entry) => AthleteWithMeetEvents(
              athlete: entry.key,
              events: entry.value,
            ))
        .toList();
  }

  Map<DateTime, List<MeetEventView>> get eventsByDate {
    final Map<DateTime, List<MeetEventView>> eventsMap = {};
    for (final event in events) {
      final date = TimeHelper.getStartOfDay(event.meetEvent.startAt);
      if (!eventsMap.containsKey(date)) {
        eventsMap[date] = [];
      }
      eventsMap[date]!.add(event);
    }
    return eventsMap;
  }
}
