import '../../services/database/drift_database.dart';

class DisciplineView {
  final DisciplineData discipline;
  final DisciplineTypeData? type;

  DisciplineView({
    required this.discipline,
    this.type,
  });
}
