import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../providers/simple_athlete_provider.dart';

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
          return ListTile(
            title: Text(
                '${athlete.athlete.firstName} ${athlete.athlete.lastName}'),
            subtitle: Text(athlete.club?.name ?? ''),
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
