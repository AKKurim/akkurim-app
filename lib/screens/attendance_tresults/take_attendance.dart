import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/training_providers.dart';
import '../../models/views/training_view.dart';
import '../../models/views/simple_athlete_view.dart';
import '../../models/views/trainer_view.dart';
import '../../utils/utils.dart';
import '../../widgets/save_button.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class TakeAttendance extends ConsumerStatefulWidget {
  final TrainingView training;
  const TakeAttendance({super.key, required this.training});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TakeAttendanceState();
}

class _TakeAttendanceState extends ConsumerState<TakeAttendance> {
  late Map<SimpleAthleteView, String> athleteAttendance;
  late Map<TrainerView, String> trainerAttendance;
  final TextEditingController _trainingNoteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    athleteAttendance = widget.training.athleteAttendance.isNotEmpty
        ? widget.training.athleteAttendance
        : {for (var athlete in widget.training.group.athletes) athlete: ''};
    trainerAttendance = widget.training.trainerAttendance.isNotEmpty
        ? widget.training.trainerAttendance
        : {for (var trainer in widget.training.group.trainers) trainer: ''};
    _trainingNoteController.text = widget.training.training.description ?? '';
  }

  saveTrainingData() {
    ref.read(trainingsPProvider.notifier).saveAttendance(
          widget.training,
          athleteAttendance,
          trainerAttendance,
          _trainingNoteController.text,
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.takeAttendance),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 68),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(widget.training.group.group.name),
                        trailing: Text(
                          TimeHelper.getFullDateWithTime(
                              widget.training.training.datetime, context,
                              withDay: false),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      ListTile(
                        title: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.content,
                            ),
                            Expanded(
                              child: TextField(
                                maxLines: null,
                                controller: _trainingNoteController,
                                decoration: InputDecoration(
                                  //border: InputBorder.none,
                                  hintText:
                                      AppLocalizations.of(context)!.contentHint,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...trainerAttendance.entries.map(
                        (entry) {
                          final trainer = entry.key;
                          return ListTile(
                            title: Text(trainer.simpleAthlete.fullName),
                            trailing: SegmentedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.resolveWith((states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return switch (trainerAttendance[trainer]) {
                                      'p' => Colors.green,
                                      'a' => Colors.red,
                                      'e' => Colors.yellow,
                                      _ => Colors.grey,
                                    };
                                  }
                                  return Colors.transparent;
                                }),
                              ),
                              showSelectedIcon: false,
                              // I want to change the color of the selected icon
                              segments: <ButtonSegment<String>>[
                                ButtonSegment<String>(
                                  value: 'p',
                                  icon: const Icon(Icons.check),
                                ),
                                ButtonSegment<String>(
                                  value: 'a',
                                  icon: const Icon(Icons.close),
                                ),
                                ButtonSegment<String>(
                                  value: 'e',
                                  icon: const Icon(Icons.note_alt),
                                ),
                              ],
                              selected: {trainerAttendance[trainer]},
                              onSelectionChanged: (Set<String?> newSelection) {
                                setState(() {
                                  trainerAttendance[trainer] =
                                      newSelection.first ??
                                          ''; // handle nullable value
                                });
                              },
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(),
                      ...athleteAttendance.entries.map(
                        (entry) {
                          final athlete = entry.key;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              title: Text(athlete.fullName),
                              trailing: SegmentedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.resolveWith((states) {
                                    if (states.contains(WidgetState.selected)) {
                                      return switch (
                                          athleteAttendance[athlete]) {
                                        'p' => Colors.green,
                                        'a' => Colors.red,
                                        'e' => Colors.yellow,
                                        _ => Colors.grey,
                                      };
                                    }
                                    return Colors.transparent;
                                  }),
                                ),
                                showSelectedIcon: false,
                                // I want to change the color of the selected icon
                                segments: <ButtonSegment<String>>[
                                  ButtonSegment<String>(
                                    value: 'p',
                                    icon: const Icon(Icons.check),
                                  ),
                                  ButtonSegment<String>(
                                    value: 'a',
                                    icon: const Icon(Icons.close),
                                  ),
                                  ButtonSegment<String>(
                                    value: 'e',
                                    icon: const Icon(Icons.note_alt),
                                  ),
                                ],
                                selected: {athleteAttendance[athlete]},
                                onSelectionChanged:
                                    (Set<String?> newSelection) {
                                  setState(() {
                                    athleteAttendance[athlete] =
                                        newSelection.first ??
                                            ''; // handle nullable value
                                  });
                                },
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 1,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SaveButton(saveFunction: saveTrainingData),
        ],
      ),
    );
  }
}
