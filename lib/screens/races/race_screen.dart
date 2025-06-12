import 'package:ak_kurim_app/models/views/simple_athlete_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/views/full_meet_view.dart';
import '../../utils/utils.dart';
import '../../utils/config.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../../providers/meet_providers.dart';
import 'package:url_launcher/url_launcher.dart';

class RaceScreen extends ConsumerStatefulWidget {
  final String meetId;
  final int initialIndex;
  const RaceScreen({super.key, required this.meetId, this.initialIndex = 0});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RaceScreenState();
}

class _RaceScreenState extends ConsumerState<RaceScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.index = widget.initialIndex;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FullMeetView? meet =
        ref.watch(fullMeetProviderPProvider(meetId: widget.meetId)).when(
              data: (data) => data,
              error: (error, stackTrace) => null,
              loading: () => null,
            );
    var athletesWithEvents = meet?.athletesWithEvents ?? [];
    athletesWithEvents.sort((a, b) => a.athlete.athlete.lastName
        .toLowerCase()
        .compareTo(b.athlete.athlete.lastName.toLowerCase()));

    if (meet != null) {
      final id = meet.meet.id.split('-').last;
      return Scaffold(
        appBar: AppBar(
          title: Text(meet.meet.name),
        ),
        body: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 16),
                TextButton.icon(
                  onPressed: () {
                    // todo download PDF from server
                    // show a dialog with coming soon message
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Coming Soon'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  label: const Text('PDF'),
                  icon: const Icon(Icons.picture_as_pdf),
                  style: TextButton.styleFrom(
                    foregroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                const Spacer(),
                // button to open proposition URL
                TextButton(
                  onPressed: () {
                    launchUrl(Config.propositionUrl(id));
                  },
                  style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer),
                  child: Text(
                    AppLocalizations.of(context)!.programme,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    launchUrl(Config.resultsUrl(id));
                  },
                  style: TextButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer),
                  child: Text(
                    AppLocalizations.of(context)!.results,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            TabBar(
              controller: tabController,
              tabs: [
                Tab(text: AppLocalizations.of(context)!.raceTab1),
                Tab(text: AppLocalizations.of(context)!.raceTab2),
                Tab(text: AppLocalizations.of(context)!.raceTab3),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount: meet.events.length,
                    itemBuilder: (context, index) {
                      final event = meet.events[index];
                      final List<SimpleAthleteView> athletes =
                          event.athletesWithResults.keys.toList();
                      return Column(
                        children: [
                          if (index == 0 ||
                              event.meetEvent.startAt.day !=
                                  meet.events[index - 1].meetEvent.startAt.day)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Text(
                                      TimeHelper.getFullDateWithoutTime(
                                          event.meetEvent.startAt, context),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              ),
                            ),
                            color: DateTime.now()
                                    .isAfter(event.meetEvent.startAt.add(
                              const Duration(minutes: 15),
                            ))
                                ? Colors.green[800]
                                : athletes.isNotEmpty
                                    ? Colors.orange[900]?.withAlpha(200)
                                    : null,
                            child: ListTile(
                              title: Text(
                                  '${TimeHelper.getMinHourFromDateTime(event.meetEvent.startAt)} - ${event.discipline?.description} ${event.meetEvent.phase != null && event.meetEvent.phase!.toLowerCase().contains('finále') ? '${event.meetEvent.phase} ' : ''}- ${event.category?.description}',
                                  style: athletes.isNotEmpty
                                      ? TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)
                                      : null),
                              subtitle: athletes.isNotEmpty
                                  ? Text(
                                      athletes
                                          .map((athlete) => athlete.fullName)
                                          .join(', '),
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ))
                                  : null,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  ListView.builder(
                      itemCount: athletesWithEvents.length,
                      itemBuilder: (context, index) {
                        final athlete = athletesWithEvents[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              )),
                          child: ListTile(
                            title: Text(
                                '${athlete.athlete.athlete.lastName} ${athlete.athlete.athlete.firstName}',
                                style: athlete.events.isNotEmpty
                                    ? TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)
                                    : null),
                            subtitle: athlete.events.isNotEmpty
                                ? Text(
                                    athlete.events
                                        .map((event) =>
                                            '${meet.isMultiDay ? '${TimeHelper.getWeekDayName(event.meetEvent.startAt, context)} ' : ''}${TimeHelper.getMinHourFromDateTime(event.meetEvent.startAt)} - ${event.discipline?.description} ${event.meetEvent.phase != null && athlete.isDoubleDiscipline(event.discipline!.id) ? '(${event.meetEvent.phase})' : ''}')
                                        .join('\n'),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary))
                                : null,
                          ),
                        );
                      }),
                  if (athletesWithEvents.any((athlete) =>
                      athlete.events.any((element) => element.result != null)))
                    ListView.builder(
                      itemCount: athletesWithEvents.length,
                      itemBuilder: (context, index) {
                        final athlete = athletesWithEvents[index];
                        if (athlete.events
                            .any((element) => element.result != null)) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                  '${athlete.athlete.athlete.lastName} ${athlete.athlete.athlete.firstName}',
                                  style: athlete.events.isNotEmpty
                                      ? TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)
                                      : null),
                              subtitle: athlete.events.isNotEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .discipline,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 66,
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .result,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 36,
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .wind,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 36,
                                              child: Text(
                                                'pb?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 38,
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .points,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        ...athlete.events
                                            .where(
                                                (event) => event.result != null)
                                            .map((event) {
                                          return Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  '${event.discipline!.shortDescription} ${event.meetEvent.phase != null && athlete.isDoubleDiscipline(event.discipline!.id, onlyCountResults: true) ? '(${event.meetEvent.phase})' : ''}',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 66,
                                                child: Text(
                                                  event.result!,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 36,
                                                child: false
                                                    ? Text(
                                                        //event.wind,
                                                        '+2.0', // Placeholder for wind, replace with actual value
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary),
                                                      )
                                                    : const SizedBox.shrink(),
                                              ),
                                              SizedBox(
                                                width: 36,
                                                child: false
                                                    ? Text(
                                                        //"${result.pbSb}",
                                                        'PB', // Placeholder for pbSb, replace with actual value
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary),
                                                      )
                                                    : const SizedBox.shrink(),
                                              ),
                                              SizedBox(
                                                width: 38,
                                                child: false
                                                    ? Text(
                                                        //"${result.points} b",
                                                        '1000', // Placeholder for points, replace with actual value
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primary),
                                                      )
                                                    : const SizedBox.shrink(),
                                              ),
                                            ],
                                          );
                                        }),
                                      ],
                                    )
                                  : null,
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    )
                  else
                    Center(
                      child: Text(AppLocalizations.of(context)!.noResults,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary)),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
