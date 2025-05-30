import '../../services/database/drift_database.dart';
import '../../utils/utils.dart';
import './result_view.dart';

class FullAthleteView {
  final AthleteData athlete;
  final AthleteStatusData athleteStatus;
  final ClubData? club;
  final List<GuardianData> guardians;
  final List<ResultView> results;
  final List<AthleteSignUpFormData> signUpForms;

  FullAthleteView({
    required this.athlete,
    required this.athleteStatus,
    this.club,
    required this.guardians,
    required this.results,
    required this.signUpForms,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FullAthleteView && other.athlete.id == athlete.id;
  }

  @override
  int get hashCode => athlete.id.hashCode;

  String get fullName {
    return '${athlete.lastName} ${athlete.firstName}';
  }

  DateTime get birthDate {
    return Utils.parseBirthNumber(athlete.birthNumber);
  }

  Map<int, ResultView> pbs() {
    final Map<int, ResultView> personalBests = {};
    for (final result in results) {
      if (result.athleteMeetEvent.result == null ||
          result.athleteMeetEvent.result!.isEmpty ||
          result.athleteMeetEvent.result!.contains('DQ') ||
          result.athleteMeetEvent.result!.contains('DNS') ||
          result.discipline.description == 'Přespolní běh' ||
          result.discipline.disciplineTypeId == 3) {
        // Skip DQ, DNS, and relay results
        continue;
      }
      final key = result.discipline.id;
      if (!personalBests.containsKey(key) ||
          (result.athleteMeetEvent.result != null &&
              (personalBests[key]!.athleteMeetEvent.result == null ||
                  result < personalBests[key]!))) {
        personalBests[key] = result;
      }
    }
    // sort the map by discipline type id
    personalBests.values.toList().sort((a, b) {
      return a.discipline.disciplineTypeId
          .compareTo(b.discipline.disciplineTypeId);
    });
    // convert the map to a new map with discipline id as key
    final sortedPersonalBests = Map<int, ResultView>.fromEntries(
      personalBests.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
    );
    // return the sorted map
    return sortedPersonalBests;
  }
}
