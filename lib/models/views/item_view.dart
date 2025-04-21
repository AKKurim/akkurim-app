import '../../services/database/drift_database.dart';
import '../views/simple_athlete_view.dart';

class ItemView {
  final ItemData item;
  final ItemTypeData itemType;
  final SimpleAthleteView? athlete;

  ItemView({
    required this.item,
    required this.itemType,
    this.athlete,
  });
}
