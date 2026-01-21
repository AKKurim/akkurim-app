import 'package:ak_kurim_app/models/views/trainer_view.dart';
import 'package:ak_kurim_app/services/database/drift_database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/views/group_view.dart';
import '../../models/views/simple_athlete_view.dart';
import '../../providers/trainer_provider.dart';
import '../../providers/groups_provider.dart';
import '../../providers/training_providers.dart';
import '../../providers/filter_providers.dart';
import '../../widgets/search_bar.dart';
import '../../utils/utils.dart';
import 'package:collection/collection.dart';
import '../../widgets/save_button.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class AddGroupScreen extends ConsumerStatefulWidget {
  final GroupView groupView;
  final bool editMode;
  const AddGroupScreen({
    super.key,
    required this.groupView,
    required this.editMode,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends ConsumerState<AddGroupScreen> {
  bool saved = false;
  bool _showAllTrainers = false;
  bool _showAllAthletes = false;
  late TrainingTimeData? trainingTime;
  late String trainingDay;
  late TimeOfDay selectedSummerTime;
  late TimeOfDay selectedWinterTime;

  late final TextEditingController nameController;
  late final List<String> previousTrainersIds;
  late final List<String> previousAthletesIds;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
      text: widget.groupView.group.name,
    );

    if (widget.editMode) {
      previousTrainersIds = widget.groupView.trainers.map((trainer) {
        return trainer.trainer.id;
      }).toList();
      previousAthletesIds = widget.groupView.athletes.map((athlete) {
        return athlete.athlete.id;
      }).toList();
      TimeHelper parsedTime = TimeHelper.fromString(
        widget.groupView.trainingTime!.summerTime,
      );
      selectedSummerTime = TimeOfDay(
        hour: parsedTime.hour,
        minute: parsedTime.minute,
      );
      parsedTime = TimeHelper.fromString(
        widget.groupView.trainingTime!.winterTime,
      );
      selectedWinterTime = TimeOfDay(
        hour: parsedTime.hour,
        minute: parsedTime.minute,
      );
      trainingDay = widget.groupView.trainingTime!.day;
      trainingTime = widget.groupView.trainingTime;
    } else {
      previousTrainersIds = [];
      previousAthletesIds = [];
      selectedSummerTime = TimeOfDay.now();
      selectedWinterTime = TimeOfDay.now();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trainer = ref.watch(currentTrainerProvider);
    final currentTrainerView = trainer.maybeWhen(
      orElse: () => null,
      data: (data) => data,
    );
    final List<TrainingTimeData> allTrainingTimes = ref
        .watch(trainingTimesProvider)
        .when(data: (data) => data, error: (e, s) => [], loading: () => []);

    List<TrainerView> trainers = widget.groupView.trainers;
    trainers.sort((a, b) {
      return a.simpleAthlete.athlete.lastName
          .compareTo(b.simpleAthlete.athlete.lastName);
    });
    List<TrainerView> allTrainers = ref.watch(trainerPProvider).when(
          data: (data) => data.where((trainer) {
            return trainer.trainer.deletedAt == null &&
                trainer.simpleAthlete.athlete.status == 'active';
          }).toList(),
          error: (error, stackTrace) {
            print('Error loading trainers: $error--------');
            return [];
          },
          loading: () => [],
        );
    allTrainers.sort((a, b) {
      return a.simpleAthlete.athlete.lastName
          .compareTo(b.simpleAthlete.athlete.lastName);
    });
    List<SimpleAthleteView> athletes = widget.groupView.athletes;
    athletes.sort((a, b) {
      return a.athlete.lastName.compareTo(b.athlete.lastName);
    });
    List<SimpleAthleteView> allAthletes =
        ref.watch(filteredAthletesProvider).when(
              data: (data) => data,
              error: (error, stackTrace) => [],
              loading: () => [],
            );
    allAthletes.sort((a, b) {
      return a.athlete.lastName.compareTo(b.athlete.lastName);
    });
    List<SchoolYearData> schoolYears = ref.watch(schoolYearsProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => [],
          loading: () => [],
        );
    SchoolYearData selectedSchoolYear = schoolYears.firstWhere(
      (element) => element.id == widget.groupView.group.schoolYearId,
      orElse: () => schoolYears.firstWhere(
        (element) => element.name == Utils.getCurrentSchoolYearString(),
        orElse: () => schoolYears.first,
      ),
    );

    saveGroup() {
      ref.read(groupsPProvider.notifier).saveGroup(
            name: nameController.text,
            day: trainingDay,
            summerTime:
                TimeHelper(selectedSummerTime.hour, selectedSummerTime.minute),
            winterTime:
                TimeHelper(selectedWinterTime.hour, selectedWinterTime.minute),
            schoolYear: selectedSchoolYear,
            trainers: trainers,
            athletes: athletes,
            groupId: widget.editMode ? widget.groupView.group.id : null,
            trainingTimeId: trainingTime?.id,
            previousAthletesIds: previousAthletesIds,
            previousTrainersIds: previousTrainersIds,
          );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.groupSaved),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addGroup),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            !saved
                ? showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                              AppLocalizations.of(context)!.leaveConfirmation),
                          content:
                              Text(AppLocalizations.of(context)!.leaveWarning),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text(AppLocalizations.of(context)!.leave),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(AppLocalizations.of(context)!.stay),
                            ),
                          ],
                        ))
                : Navigator.pop(context);
          },
        ),
        actions: [],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 8,
              bottom: 68,
            ),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration:
                          const InputDecoration(labelText: 'Group Name'),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        DropdownMenu(
                            initialSelection: widget.editMode
                                ? widget.groupView.trainingTime!.day
                                : null,
                            hintText: 'Day...',
                            dropdownMenuEntries: [
                              DropdownMenuEntry<String>(
                                label: 'Monday',
                                value: 'Monday',
                              ),
                              DropdownMenuEntry<String>(
                                label: 'Tuesday',
                                value: 'Tuesday',
                              ),
                              DropdownMenuEntry<String>(
                                label: 'Wednesday',
                                value: 'Wednesday',
                              ),
                              DropdownMenuEntry<String>(
                                label: 'Thursday',
                                value: 'Thursday',
                              ),
                              DropdownMenuEntry<String>(
                                label: 'Friday',
                                value: 'Friday',
                              ),
                              DropdownMenuEntry<String>(
                                label: 'Saturday',
                                value: 'Saturday',
                              ),
                              DropdownMenuEntry<String>(
                                label: 'Sunday',
                                value: 'Sunday',
                              ),
                            ],
                            onSelected: (value) {
                              setState(() {
                                trainingDay = value!;
                                TrainingTimeData? selectedTrainingTime =
                                    allTrainingTimes.firstWhereOrNull(
                                  (element) => element.day == trainingDay,
                                );
                                if (selectedTrainingTime != null) {
                                  TimeHelper parsedTime = TimeHelper.fromString(
                                    selectedTrainingTime.summerTime,
                                  );
                                  selectedSummerTime = TimeOfDay(
                                    hour: parsedTime.hour,
                                    minute: parsedTime.minute,
                                  );
                                  parsedTime = TimeHelper.fromString(
                                    selectedTrainingTime.winterTime,
                                  );
                                  selectedWinterTime = TimeOfDay(
                                    hour: parsedTime.hour,
                                    minute: parsedTime.minute,
                                  );
                                  trainingTime = selectedTrainingTime;
                                }
                              });
                            }),
                        const Expanded(child: SizedBox()),
                        DropdownMenu(
                            initialSelection: selectedSchoolYear,
                            dropdownMenuEntries: schoolYears
                                .map((e) => DropdownMenuEntry<SchoolYearData>(
                                      label: e.name,
                                      value: e,
                                    ))
                                .toList(),
                            hintText: 'School Year...',
                            onSelected: (value) {
                              setState(() {
                                selectedSchoolYear = value!;
                              });
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.wb_sunny, color: Colors.yellow),
                        const Icon(Icons.access_time),
                        TextButton(
                          onPressed: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: selectedSummerTime,
                            );
                            if (time != null) {
                              setState(() {
                                selectedSummerTime = time;
                                trainingTime = null;
                              });
                            }
                          },
                          child: Text(selectedSummerTime.format(context),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                        ),
                        Expanded(child: const SizedBox()),
                        const Icon(Icons.ac_unit, color: Colors.blue),
                        const Icon(Icons.access_time),
                        TextButton(
                          onPressed: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: selectedWinterTime,
                            );
                            if (time != null) {
                              setState(() {
                                selectedWinterTime = time;
                                trainingTime = null;
                              });
                            }
                          },
                          child: Text(selectedWinterTime.format(context),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                        ),
                      ],
                    ),
                    Container(
                      color: Theme.of(context).colorScheme.surface,
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.trainersInGroup,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Expanded(child: Container()),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _showAllTrainers = !_showAllTrainers;
                              });
                            },
                            icon: Icon(
                              !_showAllTrainers
                                  ? Icons.add_circle
                                  : Icons.expand_less,
                              color: !_showAllTrainers
                                  ? Colors.green
                                  : Theme.of(context).colorScheme.primary,
                              fill: 1.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      child: !_showAllTrainers
                          ? Column(children: [
                              for (TrainerView trainer in trainers) ...[
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListTile(
                                    title: Text(
                                        '${trainer.simpleAthlete.athlete.lastName} ${trainer.simpleAthlete.athlete.firstName}'),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.remove_circle,
                                          color: Colors.red),
                                      onPressed: () {
                                        if (trainer.trainer.id ==
                                            currentTrainerView!.trainer.id) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  AppLocalizations.of(context)!
                                                      .cannotRemoveSelf),
                                              duration: Duration(seconds: 2),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return;
                                        }
                                        setState(() {
                                          trainers.remove(trainer);
                                        });
                                        // Remove trainer from group logic
                                      },
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: Theme.of(context).dividerColor,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                )
                              ]
                            ])
                          : Column(children: [
                              for (var trainer in allTrainers) ...[
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListTile(
                                    title: Text(
                                        '${trainer.simpleAthlete.athlete.lastName} ${trainer.simpleAthlete.athlete.firstName}'),
                                    trailing: Checkbox(
                                        value: trainers
                                            .map(
                                                (trainer) => trainer.trainer.id)
                                            .contains(trainer.trainer.id),
                                        onChanged: (value) {
                                          if (value == true) {
                                            setState(() {
                                              trainers.add(trainer);
                                            });
                                          } else {
                                            if (trainer.trainer.id ==
                                                currentTrainerView!
                                                    .trainer.id) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .cannotRemoveSelf),
                                                  duration:
                                                      Duration(seconds: 2),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                              return;
                                            }
                                            setState(() {
                                              trainers.remove(trainer);
                                            });
                                          }
                                        }),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: Theme.of(context).dividerColor,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ]),
                    ),
                    Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.athletesInGroup,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Expanded(child: Container()),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _showAllAthletes = !_showAllAthletes;
                            });
                          },
                          icon: Icon(
                            !_showAllAthletes
                                ? Icons.add_circle
                                : Icons.expand_less,
                            color: !_showAllAthletes
                                ? Colors.green
                                : Theme.of(context).colorScheme.primary,
                            fill: 1.0,
                          ),
                        ),
                      ],
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      child: !_showAllAthletes
                          ? Column(children: [
                              for (SimpleAthleteView athlete in athletes) ...[
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListTile(
                                    title: Text(
                                        '${athlete.athlete.lastName} ${athlete.athlete.firstName}'),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.remove_circle,
                                          color: Colors.red),
                                      onPressed: () {
                                        setState(() {
                                          athletes.remove(athlete);
                                        });
                                      },
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: Theme.of(context).dividerColor,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                )
                              ]
                            ])
                          : Column(children: [
                              MySearchBar(showFilterButton: false),
                              for (SimpleAthleteView athlete
                                  in allAthletes) ...[
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListTile(
                                    title: Text(
                                        '${athlete.athlete.lastName} ${athlete.athlete.firstName}'),
                                    trailing: Checkbox(
                                        value: athletes
                                            .map(
                                                (athlete) => athlete.athlete.id)
                                            .contains(athlete.athlete.id),
                                        onChanged: (value) {
                                          if (value == true) {
                                            setState(() {
                                              athletes.add(athlete);
                                            });
                                          } else {
                                            setState(() {
                                              athletes.remove(athlete);
                                            });
                                          }
                                        }),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: Theme.of(context).dividerColor,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SaveButton(
            saveFunction: saveGroup,
          )
        ],
      ),
    );
  }
}
