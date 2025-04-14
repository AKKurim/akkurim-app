import 'package:ak_kurim_app/models/online_db/trainer.dart';
import 'package:ak_kurim_app/models/views/trainer_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/views/group_view.dart';
import '../../models/views/simple_athlete_view.dart';
import '../../providers/simple_athletes_provider.dart';
import '../../providers/trainer_provider.dart';
import '../../providers/groups_provider.dart';
import '../../providers/filter_providers.dart';
import '../../widgets/search_bar.dart';

class AddGroupScreen extends ConsumerStatefulWidget {
  final GroupView groupView;
  final bool editMode;
  final TrainerView currentTrainerView;
  const AddGroupScreen({
    super.key,
    required this.groupView,
    required this.editMode,
    required this.currentTrainerView,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends ConsumerState<AddGroupScreen> {
  bool saved = false;
  bool _showAllTrainers = false;
  bool _showAllAthletes = false;
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
    if (widget.editMode) {
      nameController.text = widget.groupView.group.name;
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
              // Save group logic TODO
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
                      decoration:
                          const InputDecoration(labelText: 'Group Name'),
                    ),
                    const SizedBox(height: 16),
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
                                        if (trainer ==
                                            widget.currentTrainerView) {
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
                                                widget.currentTrainerView
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
          // save and close button
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              onPressed: () {
                setState(() {
                  saved = true;
                });
                Navigator.pop(context);
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
