import 'package:ak_kurim_app/models/views/group_view.dart';
import 'package:ak_kurim_app/widgets/month_year_selecter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import '../../providers/meet_providers.dart';
import '../../models/views/discipline_view.dart';
import '../../providers/groups_provider.dart';
import 'package:diacritic/diacritic.dart';
import '../../providers/training_results_provider.dart';
import '../../models/views/full_meet_view.dart';
import '../../utils/utils.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class TrainingResultsScreen extends ConsumerWidget {
  const TrainingResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<FullMeetView> meets =
        ref.watch(trainingResultsPProvider(preloadedMeet: null)).when(
              data: (data) => data,
              error: (error, stackTrace) =>
                  throw Exception('Error loading meets: $error, $stackTrace'),
              loading: () => [],
            );

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          DateTime now = DateTime.now();
          ref
              .read(selectedMonthYearPProvider.notifier)
              .setMonthAndYear(now.month, now.year);
        },
        child: Column(
          children: [
            MonthYearSelecter(),
            Expanded(
              child: ListView.builder(
                itemCount: meets.length,
                itemBuilder: (context, index) {
                  final meet = meets[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    child: GestureDetector(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(AppLocalizations.of(context)!
                                  .deleteTrainingResults),
                              content: Text(AppLocalizations.of(context)!
                                  .deleteTrainingResultsConfirmation),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    ref
                                        .read(trainingResultsPProvider(
                                                preloadedMeet: null)
                                            .notifier)
                                        .deleteTrainingResult(
                                          meet,
                                        );
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                      AppLocalizations.of(context)!.delete),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                      AppLocalizations.of(context)!.cancel),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: ListTile(
                        title: Text(meet.meet.name),
                        subtitle: Text(
                            '${TimeHelper.getWeekDayName(meet.meet.startAt, context)} ${TimeHelper.getDayMonthYear(meet.meet.startAt)}'),
                        onTap: () {
                          context.push(
                            '/take-training-results/${meet.meet.id}',
                            extra: meet,
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateTrainingResultForm extends ConsumerStatefulWidget {
  const CreateTrainingResultForm({super.key});

  @override
  ConsumerState<CreateTrainingResultForm> createState() =>
      _CreateTrainingResultFormState();
}

class _CreateTrainingResultFormState
    extends ConsumerState<CreateTrainingResultForm> {
  DateTime? _date;
  GroupView? _selectedGroup;
  DisciplineView? _selectedDiscipline;
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<GroupView> groups = ref.watch(groupsPProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => [],
          loading: () => [],
        );
    final List<DisciplineView> disciplines =
        ref.watch(allDisciplinesProvider).when(
              data: (data) => data,
              error: (error, stackTrace) => [],
              loading: () => [],
            );

    return Padding(
      padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)!.createTrainingResult,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),

          // Name TextField
          TextField(
            controller: _nameController,
            decoration:
                InputDecoration(labelText: AppLocalizations.of(context)!.name),
          ),

          // Date Picker
          ListTile(
            title: Text(_date == null
                ? AppLocalizations.of(context)!.selectDate
                : _date.toString().split(' ')[0]),
            leading: const Icon(Icons.calendar_today),
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                firstDate: DateTime(2023),
                lastDate: DateTime(2030),
                initialDate: _date ?? DateTime.now(),
              );
              if (picked != null) setState(() => _date = picked);
            },
          ),

          // Group Selector
          DropdownButtonFormField<GroupView>(
            value: _selectedGroup,
            onChanged: (g) => setState(() => _selectedGroup = g),
            items: groups
                .map((g) =>
                    DropdownMenuItem(value: g, child: Text(g.group.name)))
                .toList(),
            decoration:
                InputDecoration(labelText: AppLocalizations.of(context)!.group),
          ),

          const SizedBox(height: 12),

          // Discipline Search
          SearchAnchor.bar(
            barHintText: AppLocalizations.of(context)!.searchDiscipline,
            isFullScreen: false,
            suggestionsBuilder: (context, controller) {
              return disciplines
                  .where(
                (discipline) => removeDiacritics(
                        '${discipline.discipline.description} ${discipline.type?.description ?? ''} ${discipline.discipline.shortDescription}')
                    .toLowerCase()
                    .contains(
                      removeDiacritics(controller.text).toLowerCase(),
                    ),
              )
                  .map((discipline) {
                return ListTile(
                  title: Text(discipline.discipline.description),
                  subtitle: Text(
                    discipline.type?.name ?? '-',
                  ),
                  onTap: () {
                    setState(() => _selectedDiscipline = discipline);
                    controller.closeView(discipline.discipline.description);
                    FocusScope.of(context).unfocus();
                  },
                );
              }).toList();
            },
          ),

          const SizedBox(height: 16),

          FilledButton(
            onPressed: (_date != null &&
                    _selectedGroup != null &&
                    _selectedDiscipline != null &&
                    _nameController.text.isNotEmpty == true)
                ? () {
                    ref
                        .read(trainingResultsPProvider(preloadedMeet: null)
                            .notifier)
                        .createTrainingResult(
                          _date!,
                          _selectedGroup!,
                          _selectedDiscipline!,
                          _nameController.text,
                        );
                    Navigator.of(context).pop();
                  }
                : null,
            child: Text(AppLocalizations.of(context)!.create),
          ),
        ],
      ),
    );
  }
}
