import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/full_athlete_provider.dart';
import '../providers/filter_providers.dart';

class MemberProfile extends ConsumerWidget {
  final String athleteId;
  MemberProfile({super.key, required this.athleteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullAthlete = ref.watch(fullAthletePProvider(athleteId));
    final allStatuses = ref.watch(athleteStatusesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Member Profile'),
      ),
      body: fullAthlete.when(
        data: (athlete) {
          return allStatuses.when(
              data: (statuses) {
                return ListView(
                  children: [
                    ListTile(
                      title: Text(athlete.athlete.firstName),
                      subtitle: Text(athlete.athleteStatus.name),
                    ),
                    ListTile(
                      title: const Text('Club'),
                      subtitle: Text(athlete.club?.name ?? 'No Club'),
                    ),
                    // Add more fields as needed
                    DropdownMenu(
                        dropdownMenuEntries: statuses
                            .map((status) => DropdownMenuEntry(
                                  value: status.id,
                                  label: status.name,
                                ))
                            .toList(),
                        initialSelection: athlete.athleteStatus.id,
                        onSelected: (String? statusId) {
                          ref
                              .read(fullAthletePProvider(athleteId).notifier)
                              .updateAthleteStatus(athleteId,
                                  statusId ?? athlete.athleteStatus.id);
                        }),
                  ],
                );
              },
              error: (error, stack) => Text('Error: $error'),
              loading: () {
                return const Center(child: CircularProgressIndicator());
              });
        },
        error: (error, stack) => Center(child: Text('Error: $error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
