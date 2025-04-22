import 'package:ak_kurim_app/screens/races/races_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import 'settings_screen.dart';
import '../services/auth/auth_service.dart';
import 'package:table_calendar/table_calendar.dart';
import '../providers/meet_providers.dart';
import '../providers/training_providers.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import './attendance_tresults/trainings_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainings = ref.watch(trainingsPProvider);
    final meets = ref.watch(meetProvidersPProvider);
    return trainings.when(
      data: (trainingsList) => meets.when(
        data: (meetsList) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(AppLocalizations.of(context)!.nextTraining,
                    style: Theme.of(context).textTheme.headlineSmall),
                trainingsList.isNotEmpty
                    ? TrainingTile(
                        training: trainingsList.firstWhere(
                        (training) => training.training.datetime.isAfter(
                          DateTime.now().subtract(
                            const Duration(hours: 4),
                          ),
                        ),
                        orElse: () => trainingsList.first,
                      ))
                    : Text(
                        AppLocalizations.of(context)!.noUpcomingEvents,
                        style: TextStyle(fontSize: 20),
                      ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 20),
                Text(AppLocalizations.of(context)!.nextRace,
                    style: Theme.of(context).textTheme.headlineSmall),
                meetsList.isNotEmpty
                    ? MeetTile(
                        meet: meetsList.firstWhere(
                        (meet) => meet.meet.startAt.isAfter(
                          DateTime.now().subtract(
                            const Duration(hours: 10),
                          ),
                        ),
                        orElse: () => meetsList.first,
                      ))
                    : Text(
                        AppLocalizations.of(context)!.noUpcomingEvents,
                        style: TextStyle(fontSize: 20),
                      ),
              ],
            ),
          ),
        ),
        error: (error, stackTrace) => const Center(
          child: CircularProgressIndicator(),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => const Center(
        child: CircularProgressIndicator(),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
