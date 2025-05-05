import 'package:ak_kurim_app/screens/races/races_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../providers/meet_providers.dart';
import '../providers/training_providers.dart';
import './attendance_tresults/trainings_screen.dart';
import '../providers/remote_config_provider.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainings = ref.watch(trainingsPProvider);
    final meets = ref.watch(meetProvidersPProvider);
    final remoteConfig = ref.watch(remoteConfigProvider);
    return trainings.when(
      data: (trainingsList) => meets.when(
        data: (meetsList) => Padding(
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                remoteConfig.when(
                  data: (data) {
                    return data.urgentMessage != null &&
                            data.urgentMessage!.isNotEmpty
                        ? Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  data.urgentMessage!,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          )
                        : const SizedBox();
                  },
                  error: (error, stackTrace) => const SizedBox(),
                  loading: () => const SizedBox(),
                ),
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
