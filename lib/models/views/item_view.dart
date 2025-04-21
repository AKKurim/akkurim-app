import '../../services/database/drift_database.dart';

class ItemView {
  final ItemData item;
  final ItemTypeData itemType;

  ItemView({
    required this.item,
    required this.itemType,
  });
}
