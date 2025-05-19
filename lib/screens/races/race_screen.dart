import 'package:ak_kurim_app/models/views/simple_athlete_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/views/full_meet_view.dart';
import '../../utils/utils.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../../providers/meet_providers.dart';

class RaceScreen extends ConsumerStatefulWidget {
  final String meetId;
  const RaceScreen({super.key, required this.meetId});

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

    return meet != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(meet.meet.name),
              bottom: TabBar(
                controller: tabController,
                tabs: [
                  Tab(text: AppLocalizations.of(context)!.raceTab1),
                  Tab(text: AppLocalizations.of(context)!.raceTab2),
                  Tab(text: AppLocalizations.of(context)!.raceTab3),
                ],
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                    itemCount: meet.events.length,
                    itemBuilder: (context, index) {
                      final event = meet.events[index];
                      final List<SimpleAthleteView> athletes =
                          event.athletesWithResults.keys.toList();
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: ListTile(
                          title: Text(
                              '${TimeHelper.getMinHourFromDateTime(event.meetEvent.startAt)} - ${event.discipline?.description} ${event.meetEvent.phase != null && event.meetEvent.phase!.toLowerCase().contains('finále') ? '${event.meetEvent.phase} ' : ''}- ${event.category?.description}',
                              style: athletes.isNotEmpty
                                  ? TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18)
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
                          tileColor: DateTime.now()
                                  .isAfter(event.meetEvent.startAt.add(
                            const Duration(minutes: 15),
                          ))
                              ? Colors.green[800]
                              : athletes.isNotEmpty
                                  ? Colors.orange[900]?.withAlpha(200)
                                  : null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1,
                            ),
                          ),
                        ),
                      );
                    }),
                ListView.builder(
                    itemCount: athletesWithEvents.length,
                    itemBuilder: (context, index) {
                      final athlete = athletesWithEvents[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ListTile(
                          title: Text(
                              '${athlete.athlete.athlete.lastName} ${athlete.athlete.athlete.firstName}',
                              style: athlete.events.isNotEmpty
                                  ? TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18)
                                  : null),
                          subtitle: athlete.events.isNotEmpty
                              ? Text(
                                  athlete.events
                                      .map((event) =>
                                          '${TimeHelper.getMinHourFromDateTime(event.meetEvent.startAt)} - ${event.discipline?.description} - ${event.category?.shortDescription}')
                                      .join('\n'),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary))
                              : null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1,
                            ),
                          ),
                        ),
                      );
                    }),
                athletesWithEvents.any((athlete) =>
                        athlete.events.any((element) => element.result != null))
                    ? ListView.builder(
                        itemCount: athletesWithEvents.length,
                        itemBuilder: (context, index) {
                          final athlete = athletesWithEvents[index];
                          return athlete.events
                                  .any((element) => element.result != null)
                              ? Padding(
                                  padding: const EdgeInsets.all(4.0),
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
                                                    '${event.discipline?.description} - ${event.result ?? 'not found'}')
                                                .join('\n'),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          )
                                        : null,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink();
                        },
                      )
                    : Center(
                        child: Text("No results found",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary)),
                      ),
              ],
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
