import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/filter_providers.dart';
import '../services/database/drift_database.dart';
import '../utils/utils.dart';

class AthleteFilterOptions extends ConsumerWidget {
  const AthleteFilterOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showFilters = ref.watch(showFiltersProvider);
    final statusFilter = ref.watch(statusFilterProvider);
    final statuses = ref.watch(athleteStatusesProvider).maybeWhen(orElse: () {
      return [];
    }, data: (data) {
      return data;
    });
    if (statusFilter.isEmpty && statuses.isNotEmpty) {
      statusFilter
          .add(statuses.where((status) => status.name == "Active").first);
    } // this forces at least one status to be selected

    return AnimatedSize(
      duration: Duration(milliseconds: 200),
      child: showFilters
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (String status in statuses) ...[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          if (statusFilter.contains(status)) {
                            statusFilter.remove(status);
                          } else {
                            statusFilter.add(status);
                          }
                          ref.read(statusFilterProvider.notifier).state =
                              Set<String>.from(statusFilter);
                        },
                        child: Chip(
                          label: Text(Utils.getStatusName(status, context)),
                          backgroundColor: statusFilter.contains(status)
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.surface,
                          labelStyle: TextStyle(
                            color: statusFilter.contains(status)
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    )
                  ],
                ],
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
