import '../../services/database/drift_database.dart';
import './meet_event_view.dart';

class FullMeetView {
  MeetData meet;
  List<MeetEventView> events;

  FullMeetView({
    required this.meet,
    required this.events,
  });
}
