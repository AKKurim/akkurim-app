import '../../services/database/drift_database.dart';

class MeetView {
  MeetData meet;
  List<MeetEventData> events;

  MeetView({
    required this.meet,
    required this.events,
  });
}
