import '../../services/database/drift_database.dart';

class ResultView implements Comparable<ResultView> {
  AthleteMeetEventData athleteMeetEvent;
  DisciplineData discipline;
  MeetData meet;

  ResultView({
    required this.athleteMeetEvent,
    required this.discipline,
    required this.meet,
  });

  @override
  //create compar method to compare by result parsed to double and by discipline_type_id
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResultView &&
        other.athleteMeetEvent.result == athleteMeetEvent.result &&
        other.discipline.id == discipline.id;
  }

  @override
  int get hashCode => athleteMeetEvent.result.hashCode ^ discipline.id.hashCode;

  @override
  int compareTo(ResultView other) {
    if (discipline.disciplineTypeId != other.discipline.disciplineTypeId) {
      throw ArgumentError(
          'Cannot compare results with different discipline types');
    }
    // use regex to remove any non-numeric characters from the result strings
    // and parse them to double
    String? result1Str =
        athleteMeetEvent.result?.replaceAll(RegExp(r'[^0-9.]'), '');
    String? result2Str =
        other.athleteMeetEvent.result?.replaceAll(RegExp(r'[^0-9.]'), '');
    double? result1 = double.tryParse(result1Str ?? '');
    double? result2 = double.tryParse(result2Str ?? '');

    if (result1 == null && result2 == null) {
      return 0; // Both results are null, considered equal
    } else if (result1 == null) {
      // return the non-null result as greater
      return 1;
    } else if (result2 == null) {
      return -1;
    }

    switch (discipline.disciplineTypeId) {
      case 1 || 3:
        // lower is better (e.g., time-based disciplines)
        return result1.compareTo(result2);
      case 2 || 4 || 5 || 6:
        // higher is better (e.g., distance-based disciplines)
        return result2.compareTo(result1);
      default:
        throw ArgumentError(
            'Unknown discipline type ID: ${discipline.disciplineTypeId}');
    }
  }

  bool operator <(ResultView other) => compareTo(other) < 0;
  bool operator <=(ResultView other) => compareTo(other) <= 0;
  bool operator >(ResultView other) => compareTo(other) > 0;
  bool operator >=(ResultView other) => compareTo(other) >= 0;
}
