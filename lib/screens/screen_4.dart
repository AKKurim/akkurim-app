import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../providers/simple_athlete_provider.dart';
import '../utils/utils.dart';

class Screen4 extends ConsumerWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simpleAthlete = ref.watch(simpleAthletePProvider);
    return simpleAthlete.maybeWhen(orElse: () {
      return const Center(
        child: CircularProgressIndicator(),
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
                    '${athlete.athlete.firstName} ${athlete.athlete.lastName} (${Utils.parseBirthNumber(athlete.athlete.birthNumber).year.toString()})',
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
    }, error: (error, stackTrace) {
      return Center(
        child: Text(
          error.toString(),
          style: const TextStyle(color: Colors.red),
        ),
      );
    });
  }
}
