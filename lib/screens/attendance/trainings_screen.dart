import 'package:ak_kurim_app/models/online_db/group.dart';
import 'package:ak_kurim_app/models/online_db/training.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import '../../providers/app_settings_provider.dart';
import '../../providers/training_providers.dart';
import '../../models/views/training_view.dart';
import '../../providers/groups_provider.dart';
import '../../models/views/group_view.dart';
import '../../utils/utils.dart';

class TrainingsScreen extends ConsumerWidget {
  const TrainingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<TrainingView> trainings = ref.watch(trainingsPProvider).when(
          data: (data) => data,
          error: (error, stackTrace) =>
              throw Exception('Error loading trainings: $error, $stackTrace'),
          loading: () => [],
        );

    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            const SizedBox(width: 16),
            Text(
              'Trainings', // TODO localize
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
              return Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      const Icon(Icons.calendar_today),
                      const Icon(Icons.access_time),
                      const SizedBox(width: 8),
                      Text(
                          '${TimeHelper.getDayMonthYear(training.training.datetime)} (${TimeHelper.getMinHourFromDateTime(training.training.datetime)})',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: ListTile(
                      title: Text(training.group.group.name),
                      subtitle: Text(training.group.trainers
                          .map((trainer) =>
                              '${trainer.simpleAthlete.athlete.lastName} ${trainer.simpleAthlete.athlete.firstName}')
                          .join(', ')),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '/${training.group.athletes.length.toString()}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(Icons.people),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              );
            },
          ),
        ),
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
          error: (error, stackTrace) =>
              throw Exception('Error loading groups: $error, $stackTrace'),
          loading: () => [],
        );

    return Padding(
      padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Create Training',
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
            decoration: const InputDecoration(labelText: 'Group'),
          ),

          const SizedBox(height: 12),

          // Select Date Range
          ElevatedButton.icon(
            icon: const Icon(Icons.date_range),
            label: Text(_dateRange == null
                ? 'Select Date Range'
                : '${_dateRange!.start.toLocal()} → ${_dateRange!.end.toLocal()}'),
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
                  }
                : null,
            child: const Text('Create'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
