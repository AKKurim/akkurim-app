import 'package:ak_kurim_app/models/views/simple_athlete_view.dart';

import '../../services/database/drift_database.dart';
import './meet_event_view.dart';

class FullMeetView {
  MeetData meet;
  List<MeetEventView> events;

  FullMeetView({
    required this.meet,
    required this.events,
  });

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

  int get athletesCount {
    final athletes = events
        .expand((event) => event.athletesWithResults.keys)
        .toSet()
        .toList();
    return athletes.length;
  }

  bool get isMultiDay {
    return meet.startAt.difference(meet.endAt).inDays < 0;
  }
}
