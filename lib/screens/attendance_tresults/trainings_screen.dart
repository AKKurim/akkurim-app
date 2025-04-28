import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import '../../providers/app_settings_provider.dart';
import '../../providers/training_providers.dart';
import '../../models/views/training_view.dart';
import '../../providers/groups_provider.dart';
import '../../models/views/group_view.dart';
import '../../utils/utils.dart';
import 'take_attendance.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class TrainingsScreen extends ConsumerWidget {
  const TrainingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TrainingView> trainings = ref.watch(trainingsPProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => [],
          loading: () => [],
        );

    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            const SizedBox(width: 16),
            Text(
              AppLocalizations.of(context)!.trainingTab1,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: trainings.length,
            itemBuilder: (_, index) {
              final training = trainings[index];
              return TrainingTile(training: training);
            },
          ),
        ),
      ],
    );
  }
}

class TrainingTile extends ConsumerWidget {
  const TrainingTile({
    super.key,
    required this.training,
  });

  final TrainingView training;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 8),
            const Icon(Icons.calendar_today),
            const Icon(Icons.access_time),
            const SizedBox(width: 8),
            Text(
                '${TimeHelper.getWeekDayName(training.training.datetime, context)} ${TimeHelper.getDayMonthYear(training.training.datetime)} (${TimeHelper.getMinHourFromDateTime(training.training.datetime)})',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: GestureDetector(
            onLongPress: () {
              // show alert dialog to delete training
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(AppLocalizations.of(context)!.deleteTraining),
                    content: Text(AppLocalizations.of(context)!
                        .deleteTrainingConfirmation),
                    actions: [
                      TextButton(
                        onPressed: () {
                          ref
                              .read(trainingsPProvider.notifier)
                              .deleteTraining(training);
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!.delete),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(AppLocalizations.of(context)!.cancel),
                      ),
                    ],
                  );
                },
              );
            },
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TakeAttendance(
                      training: training,
                    ),
                  ),
                );
              },
              title: Text(training.group.group.name),
              subtitle: Text(training.group.trainers
                  .map((trainer) =>
                      '${trainer.simpleAthlete.athlete.lastName} ${trainer.simpleAthlete.athlete.firstName}')
                  .join(', ')),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${training.presentAthletesCount}/${training.group.athletes.length.toString()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.people,
                      color: training.presentAthletesCount != 0
                          ? Colors.green
                          : Colors.red),
                ],
              ),
              // highlight active training
              tileColor: TimeHelper.isSameDay(
                      training.training.datetime, DateTime.now())
                  ? Colors.green.withAlpha(100)
                  : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class CreateTrainingForm extends ConsumerStatefulWidget {
  const CreateTrainingForm({super.key});

  @override
  ConsumerState<CreateTrainingForm> createState() => _CreateTrainingFormState();
}

class _CreateTrainingFormState extends ConsumerState<CreateTrainingForm> {
  GroupView? _selectedGroup;
  DateTimeRange? _dateRange;

  @override
  Widget build(BuildContext context) {
    final List<GroupView> groups = ref.watch(groupsPProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => [],
          loading: () => [],
        );

    return Padding(
      padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)!.createTraining,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),

          // Select Group
          DropdownButtonFormField<GroupView>(
            value: _selectedGroup,
            onChanged: (value) => setState(() => _selectedGroup = value),
            items: groups
                .map((g) =>
                    DropdownMenuItem(value: g, child: Text(g.group.name)))
                .toList(),
            decoration:
                InputDecoration(labelText: AppLocalizations.of(context)!.group),
          ),

          const SizedBox(height: 12),

          // Select Date Range
          ElevatedButton.icon(
            icon: const Icon(Icons.date_range),
            label: Text(_dateRange == null
                ? AppLocalizations.of(context)!.selectDate
                : '${_dateRange!.start.toLocal().toString().split(" ")[0]} → ${_dateRange!.end.toLocal().toString().split(" ")[0]}'),
            onPressed: () async {
              final now = DateTime.now();
              final picked = await showDateRangePicker(
                locale: ref.watch(appSettingsPProvider).maybeWhen(
                      orElse: () => null,
                      data: (locale) => locale.locale,
                    ),
                context: context,
                firstDate: now,
                lastDate: now.add(const Duration(days: 365)),
              );
              if (picked != null) {
                setState(() => _dateRange = picked);
              }
            },
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: (_selectedGroup != null && _dateRange != null)
                ? () {
                    ref.read(trainingsPProvider.notifier).createTrainings(
                          _selectedGroup!,
                          _dateRange!.start,
                          _dateRange!.end,
                          90, // TODO: Get training duration from user input
                        );
                    Navigator.of(context).pop(); // Dismiss sheet
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                            AppLocalizations.of(context)!.trainingsCreated),
                      ),
                    );
                  }
                : null,
            child: Text(AppLocalizations.of(context)!.create),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
