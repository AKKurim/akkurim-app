import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import '../providers/filter_providers.dart';
import '../utils/utils.dart';

class AthleteListView extends HookConsumerWidget {
  const AthleteListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simpleAthlete = ref.watch(filteredAthletesProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: simpleAthlete.maybeWhen(orElse: () {
        return Center(
          child: Container(),
        );
      }, data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final athlete = data[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                title: Row(
                  children: [
                    Text(
                      '${athlete.athlete.lastName} ${athlete.athlete.firstName} (${Utils.parseBirthNumber(athlete.athlete.birthNumber).year.toString()})',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                trailing: Chip(
                  label: Text('Active'),
                  backgroundColor: Colors.green.withValues(alpha: 0.2),
                  labelStyle: TextStyle(color: Colors.green),
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 0.5,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
