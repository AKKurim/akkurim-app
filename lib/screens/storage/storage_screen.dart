import 'package:ak_kurim_app/providers/filter_providers.dart';
import 'package:ak_kurim_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../../providers/item_providers.dart';
import '../../models/views/item_view.dart';
import '../../services/database/drift_database.dart';
import '../../models/views/simple_athlete_view.dart';
import '../../providers/simple_athletes_provider.dart';

class StorageScreen extends ConsumerWidget {
  const StorageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ItemView> items = ref.watch(itemProviderPProvider).when(
          data: (data) => data,
          error: (error, stackTrace) =>
              throw Exception('Error loading items: $error, $stackTrace'),
          loading: () => [],
        );
    final groupedItems = <ItemTypeData, List<ItemView>>{};
    for (var item in items) {
      groupedItems.putIfAbsent(item.itemType, () => []).add(item);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: groupedItems.entries.map(
          (entry) {
            final type = entry.key;
            final items = entry.value;

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    type.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                  childrenPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  children: items.map(
                    (item) {
                      return GestureDetector(
                        onLongPress: () {},
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          title: Text(item.item.name),
                          subtitle: Text(item.athlete != null
                              ? item.athlete!.fullName
                              : '-'),
                          trailing: const Icon(Icons.swap_horiz),
                          onTap: () {
                            _openAthleteSelector(context, item, ref);
                          },
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

void _openAthleteSelector(BuildContext context, ItemView item, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return AthleteSelectorSheet(
        item: item,
        onSelect: (athleteId) {
          ref.read(itemProviderPProvider.notifier).updateItem(item.item.id,
              item.item.name, item.item.description ?? '', item.itemType.id,
              athleteId: athleteId);
          Navigator.pop(context);
          FocusScope.of(context).unfocus();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                athleteId == null
                    ? 'Item "${item.item.name}" assigned to Central Storage'
                    : 'Item "${item.item.name}" assigned}',
              ),
            ),
          );
        },
      );
    },
  );
}

class AthleteSelectorSheet extends ConsumerWidget {
  final ItemView item;

  final void Function(String? athleteId) onSelect;

  const AthleteSelectorSheet({
    super.key,
    required this.item,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? selectedAthleteId;

    final List<SimpleAthleteView> athletes = ref
        .read(filteredAthletesProvider)
        .when(
          data: (data) => data,
          error: (error, stackTrace) =>
              throw Exception('Error loading athletes: $error, $stackTrace'),
          loading: () => [],
        );

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              Text('Assign "${item.item.name}" to:',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              SearchAnchor.bar(
                barHintText: 'Select Athlete or Storage',
                isFullScreen: false,
                suggestionsBuilder: (context, controller) {
                  final query = controller.text.toLowerCase();
                  final filtered = athletes.where((a) {
                    final fullName =
                        '${a.athlete.firstName} ${a.athlete.lastName}'
                            .toLowerCase();
                    return fullName.contains(query);
                  }).toList();

                  return [
                    ListTile(
                      leading: const Icon(Icons.warehouse),
                      title: const Text('Central Storage'),
                      onTap: () {
                        controller.closeView('');
                        selectedAthleteId = null;
                        onSelect(selectedAthleteId);
                      },
                    ),
                    ...filtered.map((a) {
                      final name = a.fullName;
                      return ListTile(
                        leading: const Icon(Icons.person_outline),
                        title: Text(name),
                        onTap: () {
                          controller.closeView(name);
                          selectedAthleteId = a.athlete.id;
                          onSelect(selectedAthleteId);
                        },
                      );
                    }),
                  ];
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
