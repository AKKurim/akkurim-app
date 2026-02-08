import 'package:ak_kurim_app/models/views/trainer_view.dart';
import 'package:ak_kurim_app/services/database/drift_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/views/group_view.dart';
import '../../models/views/simple_athlete_view.dart';
import '../../providers/trainer_provider.dart';
import '../../providers/groups_provider.dart';
import '../../providers/training_providers.dart';
import '../../providers/filter_providers.dart';
import '../../widgets/search_bar.dart';
import '../../utils/utils.dart';
import '../../widgets/save_button.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class AddGroupScreen extends ConsumerStatefulWidget {
  final String groupId;
  final bool editMode;
  final GroupView? preloadedGroup;
  const AddGroupScreen({
    super.key,
    required this.groupId,
    required this.editMode,
    this.preloadedGroup,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends ConsumerState<AddGroupScreen> {
  static const int minDuration = 1; // minutes
  static const int maxDuration = 720; // 12 hours in minutes
  bool saved = false;
  bool _showAllTrainers = false;
  bool _showAllAthletes = false;
  bool _showMetadata = true;
  late String trainingDay;
  late TimeOfDay selectedSummerTime;
  late TimeOfDay selectedWinterTime;
  late int durationSummer;
  late int durationWinter;

  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController durationSummerController;
  late final TextEditingController durationWinterController;
  late final TextEditingController defaultLocationSummerController;
  late final TextEditingController defaultLocationWinterController;
  late final List<String> previousTrainersIds;
  late final List<String> previousAthletesIds;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
      text: widget.preloadedGroup?.group.name ?? '',
    );

    descriptionController = TextEditingController(
      text: widget.preloadedGroup?.group.description ?? '',
    );

    if (widget.editMode) {
      previousTrainersIds = widget.preloadedGroup!.trainers.map((trainer) {
        return trainer.trainer.id;
      }).toList();
      previousAthletesIds = widget.preloadedGroup!.athletes.map((athlete) {
        return athlete.athlete.id;
      }).toList();
      TimeHelper parsedTime = TimeHelper.fromString(
        widget.preloadedGroup!.group.summerTime ?? '00:00',
      );
      selectedSummerTime = TimeOfDay(
        hour: parsedTime.hour,
        minute: parsedTime.minute,
      );
      parsedTime = TimeHelper.fromString(
        widget.preloadedGroup!.group.winterTime ?? '00:00',
      );
      selectedWinterTime = TimeOfDay(
        hour: parsedTime.hour,
        minute: parsedTime.minute,
      );
      trainingDay = widget.preloadedGroup!.group.dayOfWeek ?? '';
      durationSummer = widget.preloadedGroup!.group.durationSummer ?? 0;
      durationWinter = widget.preloadedGroup!.group.durationWinter ?? 0;
      durationSummerController =
          TextEditingController(text: durationSummer.toString());
      durationWinterController =
          TextEditingController(text: durationWinter.toString());
      defaultLocationSummerController = TextEditingController(
          text: widget.preloadedGroup!.group.defaultLocationSummer ?? '');
      defaultLocationWinterController = TextEditingController(
          text: widget.preloadedGroup!.group.defaultLocationWinter ?? '');
    } else {
      previousTrainersIds = [];
      previousAthletesIds = [];
      selectedSummerTime = TimeOfDay.now();
      selectedWinterTime = TimeOfDay.now();
      durationSummer = 90;
      durationWinter = 60;
      durationSummerController =
          TextEditingController(text: durationSummer.toString());
      durationWinterController =
          TextEditingController(text: durationWinter.toString());
      descriptionController = TextEditingController(text: '');
      defaultLocationSummerController = TextEditingController(text: '');
      defaultLocationWinterController = TextEditingController(text: '');
      trainingDay = '';
      //trainingTime = null;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    durationSummerController.dispose();
    durationWinterController.dispose();
    defaultLocationSummerController.dispose();
    defaultLocationWinterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final trainer = ref.watch(currentTrainerProvider);
    final currentTrainerView = trainer.maybeWhen(
      orElse: () => null,
      data: (data) => data,
    );
    final group = widget.editMode
        ? widget.preloadedGroup ??
            ref.watch(groupProvider(widget.groupId)).maybeWhen(
                  orElse: () => null,
                  data: (data) => data,
                )
        : GroupView.empty(trainer: currentTrainerView!);

    List<TrainerView> trainers = group?.trainers ?? [];
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
            return [];
          },
          loading: () => [],
        );
    allTrainers.sort((a, b) {
      return a.simpleAthlete.athlete.lastName
          .compareTo(b.simpleAthlete.athlete.lastName);
    });
    List<SimpleAthleteView> athletes = group?.athletes ?? [];
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
      (element) => element.id == group?.group.schoolYearId,
      orElse: () => schoolYears.firstWhere(
        (element) => element.name == Utils.getCurrentSchoolYearString(),
        orElse: () => schoolYears.first,
      ),
    );

    saveGroup() {
      // check if training day is unitialized
      if (trainingDay.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.notSelectedDayError),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      if (nameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.groupNameCannotBeEmpty),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      // validate duration ranges
      if (durationSummer < minDuration ||
          durationSummer > maxDuration ||
          durationWinter < minDuration ||
          durationWinter > maxDuration) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!
                .durationInvalidRange(minDuration, maxDuration)),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      ref.read(groupsPProvider.notifier).saveGroup(
            name: nameController.text,
            description: descriptionController.text,
            day: trainingDay,
            summerTime:
                TimeHelper(selectedSummerTime.hour, selectedSummerTime.minute),
            winterTime:
                TimeHelper(selectedWinterTime.hour, selectedWinterTime.minute),
            schoolYear: selectedSchoolYear,
            trainers: trainers,
            athletes: athletes,
            groupId: widget.editMode ? group?.group.id : null,
            previousAthletesIds: previousAthletesIds,
            previousTrainersIds: previousTrainersIds,
            durationSummer: durationSummer,
            durationWinter: durationWinter,
            defaultLocationSummer: defaultLocationSummerController.text,
            defaultLocationWinter: defaultLocationWinterController.text,
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
        title: widget.editMode
            ? Text(AppLocalizations.of(context)!.editGroup)
            : Text(AppLocalizations.of(context)!.addGroup),
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
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                labelText:
                                    AppLocalizations.of(context)!.groupName),
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _showMetadata = !_showMetadata;
                            });
                          },
                          icon: Icon(_showMetadata
                              ? Icons.expand_less
                              : Icons.expand_more),
                          label: Text(_showMetadata
                              ? AppLocalizations.of(context)!.hideDetails
                              : AppLocalizations.of(context)!.showDetails),
                        ),
                      ],
                    ),
                    if (_showMetadata) ...[
                      const SizedBox(height: 8),
                      TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.description,
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          DropdownMenu(
                              initialSelection: widget.editMode
                                  ? group?.group.dayOfWeek
                                  : null,
                              hintText: AppLocalizations.of(context)!.dayHint,
                              dropdownMenuEntries: [
                                DropdownMenuEntry<String>(
                                  label: AppLocalizations.of(context)!.monday,
                                  value: 'Monday',
                                ),
                                DropdownMenuEntry<String>(
                                  label: AppLocalizations.of(context)!.tuesday,
                                  value: 'Tuesday',
                                ),
                                DropdownMenuEntry<String>(
                                  label:
                                      AppLocalizations.of(context)!.wednesday,
                                  value: 'Wednesday',
                                ),
                                DropdownMenuEntry<String>(
                                  label: AppLocalizations.of(context)!.thursday,
                                  value: 'Thursday',
                                ),
                                DropdownMenuEntry<String>(
                                  label: AppLocalizations.of(context)!.friday,
                                  value: 'Friday',
                                ),
                                DropdownMenuEntry<String>(
                                  label: AppLocalizations.of(context)!.saturday,
                                  value: 'Saturday',
                                ),
                                DropdownMenuEntry<String>(
                                  label: AppLocalizations.of(context)!.sunday,
                                  value: 'Sunday',
                                ),
                              ],
                              onSelected: (value) {
                                setState(() {
                                  trainingDay = value!;
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
                              hintText:
                                  AppLocalizations.of(context)!.schoolYearHint,
                              onSelected: (value) {
                                setState(() {
                                  selectedSchoolYear = value!;
                                });
                              }),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: defaultLocationSummerController,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!
                                    .locationSummer,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: defaultLocationWinterController,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!
                                    .locationWinter,
                              ),
                            ),
                          ),
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
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Icons.wb_sunny,
                                    color: Colors.yellow),
                                const Icon(Icons.timer),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    controller: durationSummerController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      labelText:
                                          '${AppLocalizations.of(context)!.duration} (min)',
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        durationSummer =
                                            int.tryParse(val) ?? durationSummer;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(Icons.ac_unit, color: Colors.blue),
                                const Icon(Icons.timer),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    controller: durationWinterController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      labelText:
                                          '${AppLocalizations.of(context)!.duration} (min)',
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        durationWinter =
                                            int.tryParse(val) ?? durationWinter;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
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
