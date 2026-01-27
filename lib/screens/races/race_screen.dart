import 'package:ak_kurim_app/models/views/simple_athlete_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/views/full_meet_view.dart';
import '../../utils/utils.dart';
import '../../config.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../../providers/meet_providers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import '../../utils/pdf_gen.dart';

class RaceScreen extends ConsumerStatefulWidget {
  final String meetId;
  final int initialIndex;
  final FullMeetView? preloadedMeet;
  const RaceScreen(
      {super.key,
      required this.meetId,
      this.initialIndex = 0,
      this.preloadedMeet});

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
    final FullMeetView? meet = ref
        .watch(fullMeetProviderPProvider(
            meetId: widget.meetId, preloadedMeet: widget.preloadedMeet))
        .when(
          data: (data) => data,
          error: (error, stackTrace) => throw error,
          loading: () => null,
        );
    var athletesWithEvents = meet?.athletesWithEvents ?? [];
    athletesWithEvents.sort((a, b) => a.athlete.athlete.lastName
        .toLowerCase()
        .compareTo(b.athlete.athlete.lastName.toLowerCase()));

    if (meet != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(meet.meet.name),
        ),
        body: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 16),
                Text(meet.meet.externalId!),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {
                    generateAndShareMeetPdf(meet: meet, context_: context);
                  },
                  label: const Text('PDF'),
                  icon: const Icon(Icons.share_sharp),
                  style: TextButton.styleFrom(
                    foregroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                    backgroundColor:
                        // use some sort of red color for PDF button,
                        Colors.red[800]?.withAlpha(200),
                  ),
                ),
                const Spacer(),
                // button to open proposition URL
                TextButton(
                  onPressed: () {
                    if (meet.meet.type.contains('CAS')) {
                      launchUrl(Config.propositionUrl(meet.meet.externalId!));
                    }
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
                    if (meet.meet.type.contains('CAS')) {
                      launchUrl(Config.resultsUrl(meet.meet.externalId!));
                    }
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
                  CustomScrollView(
                    slivers: [
                      for (final pair in meet.eventsByDate.entries)
                        SliverStickyHeader(
                          header: Container(
                            padding: const EdgeInsets.all(8.0),
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            child: Row(
                              children: [
                                const SizedBox(width: 8),
                                Text(
                                    TimeHelper.getFullDateWithoutTime(
                                        pair.key, context),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final event = pair.value[index];
                              final List<SimpleAthleteView> athletes =
                                  event.athletesWithResults.keys.toList();
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
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
                                      '${TimeHelper.getMinHourFromDateTime(event.meetEvent.startAt)} - ${event.discipline?.description} ${event.meetEvent.phase != null && meet.isDoubleMeetDiscipline(event.discipline!.id, event.category!.id) ? '(${event.meetEvent.phase}) ' : ''}- ${event.category?.description}',
                                      style: athletes.isNotEmpty
                                          ? TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)
                                          : null),
                                  subtitle: athletes.isNotEmpty
                                      ? Text(
                                          athletes
                                              .map(
                                                  (athlete) => athlete.fullName)
                                              .join(', '),
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ))
                                      : null,
                                ),
                              );
                            },
                            childCount: pair.value.length,
                          )),
                        ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 16), // Spacer
                      ),
                    ],
                  ),
                  // individual athletes with events
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
                                '${athlete.athlete.athlete.lastName} ${athlete.athlete.athlete.firstName}'
                                '${athlete.events.any((e) => e.bib != null && e.bib!.isNotEmpty) ? ' (${athlete.events.firstWhere((e) => e.bib != null && e.bib!.isNotEmpty).bib})' : ''}',
                                style: athlete.events.isNotEmpty
                                    ? TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)
                                    : null),
                            subtitle: athlete.events.isNotEmpty
                                ? Text(
                                    athlete.events
                                        .map((event) =>
                                            '${meet.isMultiDay ? '${TimeHelper.getWeekDayName(event.meetEvent.startAt, context)} ' : ''}${TimeHelper.getMinHourFromDateTime(event.meetEvent.startAt)} - ${event.discipline?.description} ${event.meetEvent.phase != null && (athlete.isDoubleDiscipline(event.discipline!.id) || meet.meet.name.contains('EKAG')) ? '(${event.meetEvent.phase!.replaceAll("Kvalifikace", "Kval")})' : ''}')
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
                  // athletes with results
                  if (athletesWithEvents.any((athlete) => athlete.events.any(
                      (element) =>
                          element.result != null &&
                          element.result!.isNotEmpty)))
                    ListView.builder(
                      itemCount: athletesWithEvents.length,
                      itemBuilder: (context, index) {
                        final athlete = athletesWithEvents[index];
                        if (athlete.events.any((element) =>
                            element.result != null &&
                            element.result!.isNotEmpty)) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1,
                              ),
                            ),
                            child: ListTile(
                              onTap: () => context.push(
                                  '/member/${athlete.athlete.athlete.id}/2'),
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
                                            .where((event) =>
                                                event.result != null &&
                                                event.result!.isNotEmpty)
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
                                                child: event.wind != null
                                                    ? Text(
                                                        event.wind!
                                                            .split(' ')[0],
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
                                                child: event.pbSb != null
                                                    ? Text(
                                                        "${event.pbSb}",
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
                                                child: event.points != null
                                                    ? Text(
                                                        event.points!,
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
