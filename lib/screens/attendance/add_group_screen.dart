import 'package:ak_kurim_app/models/online_db/trainer.dart';
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
  String trainingDay = 'Monday';
  TimeOfDay selectedTime = TimeOfDay.now();

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
    } else {
      previousTrainersIds = [];
      previousAthletesIds = [];
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

    List<TrainerView> trainers = widget.groupView.trainers;
    trainers.sort((a, b) {
      return a.simpleAthlete.athlete.lastName
          .compareTo(b.simpleAthlete.athlete.lastName);
    });
    List<TrainerView> allTrainers = ref.watch(trainerPProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => [],
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
            startTime: selectedTime,
            schoolYear: selectedSchoolYear,
            trainers: trainers,
            athletes: athletes,
            groupId: widget.editMode ? widget.groupView.group.id : null,
            trainingTimeId: widget.editMode &&
                    trainingDay == widget.groupView.trainingTime!.day &&
                    selectedTime.hour.toString() ==
                        widget.groupView.trainingTime!.summerTime
                            .split(":")[0] &&
                    selectedTime.minute.toString() ==
                        widget.groupView.trainingTime!.summerTime.split(":")[1]
                ? widget.groupView.trainingTime?.id
                : null,
            previousAthletesIds: previousAthletesIds,
            previousTrainersIds: previousTrainersIds,
          );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Group saved successfully!'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Group'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            !saved
                ? showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Opravdu chcete odejít?'),
                          content: const Text(
                              'Pokud odejdete, neuložené změny budou ztraceny.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text('Odejít'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Zůstat'),
                            ),
                          ],
                        ))
                : Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              saveGroup();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                    // DropdownMenu(
                    //     dropdownMenuEntries: schoolYears
                    //         .map((e) => DropdownMenuEntry<SchoolYearData>(
                    //               label: e.name,
                    //               value: e,
                    //             ))
                    //         .toList(),
                    //     hintText: 'School Year...',
                    //     onSelected: (value) {
                    //       setState(() {
                    //         selectedSchoolYear = value!;
                    //       });
                    //     }),
                    Row(
                      children: [
                        DropdownMenu(
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
                              });
                            }),
                        const Expanded(child: SizedBox()),
                        // time picker
                        const Icon(Icons.access_time),
                        TextButton(
                          onPressed: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: selectedTime,
                            );
                            if (time != null) {
                              setState(() {
                                selectedTime = time;
                              });
                            }
                          },
                          child: Text(selectedTime.format(context),
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
                            'Trainers in this group:',
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
                                            const SnackBar(
                                              content: Text(
                                                  'You cannot remove yourself from the group.'),
                                              duration: Duration(seconds: 2),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return;
                                        }
                                        trainers.remove(trainer);
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
                                                const SnackBar(
                                                  content: Text(
                                                      'You cannot remove yourself from the group.'),
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
                          'Athletes in this group:',
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
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              onPressed: () {
                saveGroup();
              },
              child: Text('Save and close',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
