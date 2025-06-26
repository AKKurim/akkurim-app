import 'package:ak_kurim_app/models/views/full_meet_view.dart';
import 'package:ak_kurim_app/models/views/simple_athlete_view.dart';
import 'package:ak_kurim_app/models/views/training_view.dart';
import 'package:ak_kurim_app/providers/simple_athletes_provider.dart';
import 'package:ak_kurim_app/screens/races/races_screen.dart';
import 'package:ak_kurim_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import '../providers/meet_providers.dart';
import '../providers/training_providers.dart';
import './attendance_tresults/trainings_screen.dart';
import '../providers/remote_config_provider.dart';
import '../providers/new_update_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/config.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final selected = useState(now);
    // get previous, current and next week range for smooth scrolling
    final DateTimeRange calendarRange =
        TimeHelper.getSelectedMonthRange(selected.value);
    final showBirthdays = useState(false);
    final events = useState<List<dynamic>>([]);
    final Set<DateTime> easterHolidays = Config.getEasterHolidays;
    final Set<DateTime> holidays = Config.holidays;

    List<SimpleAthleteView> athletes = ref.watch(simpleAthletesPProvider).when(
        data: (athletes) => athletes,
        error: (error, stackTrace) => [],
        loading: () => []);
    List<FullMeetView> meets =
        ref.watch(meetProvidersPProvider(range: calendarRange)).when(
              data: (meets) => meets,
              error: (error, stackTrace) => [],
              loading: () => [],
            );
    List<TrainingView> trainings =
        ref.watch(trainingsPProvider(range: calendarRange)).when(
              data: (trainings) => trainings,
              error: (error, stackTrace) => [],
              loading: () => [],
            );

    events.value.clear();
    events.value.addAll(meets);
    events.value.addAll(trainings);
    if (showBirthdays.value) {
      final birthdayEvents = athletes
          .where((athlete) =>
              athlete
                  .birthDay(selected.value.year)
                  .isAfter(calendarRange.start) &&
              athlete
                  .birthDay(selected.value.year)
                  .isBefore(calendarRange.end) &&
              athlete.athleteStatus.name == 'Active')
          .toList();
      events.value.addAll(birthdayEvents);
    }
    bool isEventForDayHelper = false;

    final remoteConfig = ref.watch(remoteConfigProvider);
    final bool isNewUpdateAvailable = ref
        .watch(newUpdateProvider)
        .maybeWhen(data: (data) => data, orElse: () => false);
    final PatchStatus isNewPatchAvailable = ref.watch(newPatchProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => throw Exception(
            'Error checking for new patch: $error',
          ),
          loading: () => PatchStatus.checking,
        );
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          remoteConfig.when(
            data: (data) {
              if (data.urgentMessage != null &&
                  data.urgentMessage!.isNotEmpty) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        data.urgentMessage!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
            error: (error, stackTrace) => const SizedBox(),
            loading: () => const SizedBox(),
          ),
          if (isNewUpdateAvailable)
            GestureDetector(
              onTap: () async {
                launchUrl(Config.updateUrl);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  AppLocalizations.of(context)!.newUpdateAvailable,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          else if (isNewPatchAvailable == PatchStatus.downloaded ||
              isNewPatchAvailable ==
                  PatchStatus.error) // well this is stupid but it fkn works
            GestureDetector(
              onTap: () {
                ref.read(newPatchProvider.notifier).restartApp(context);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  AppLocalizations.of(context)!.patchDownloaded,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          TableCalendar(
            rowHeight: 48.0,
            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.now().add(const Duration(days: 365 * 2)),
            focusedDay: selected.value,
            locale: AppLocalizations.of(context)!.localeName,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarFormat: CalendarFormat.month,
            availableCalendarFormats: const {
              CalendarFormat.month: '🎂',
              CalendarFormat.twoWeeks: '',
            },
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              formatButtonShowsNext: false,
              formatButtonTextStyle: const TextStyle(color: Colors.white),
              formatButtonDecoration: BoxDecoration(
                color: showBirthdays.value ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(12.0),
              ),
              formatButtonPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              titleCentered: true,
              leftChevronIcon: Icon(Icons.chevron_left),
              rightChevronIcon: Icon(Icons.chevron_right),
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              weekendTextStyle: const TextStyle(color: Colors.red),
            ),
            onFormatChanged: (format) =>
                showBirthdays.value = !showBirthdays.value,
            selectedDayPredicate: (day) => isSameDay(day, selected.value),
            onPageChanged: (focusedDay) {
              if (now.year == focusedDay.year &&
                  now.month == focusedDay.month) {
                selected.value = now;
              } else {
                selected.value = focusedDay;
              }
            },
            onDaySelected: (selectedDay, focusedDay) {
              selected.value = selectedDay;
            },
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                if (events.isNotEmpty) {
                  // final isMeet = events.any((event) => event is FullMeetView);
                  // final isTraining = events.any((event) => event
                  //     is Training); // Assuming TrainingView is the type for trainings
                  // final isBirthday =
                  //     events.any((event) => event is SimpleAthleteView);
                  // if same day, orange color
                  final Color markerColor = TimeHelper.isSameDay(
                    day,
                    DateTime.now(),
                  )
                      ? Colors.orange
                      : day.isBefore(DateTime.now())
                          ? Colors.green
                          : Colors.white;
                  return Row(
                    // icon for each type of event
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (events.any((event) => event is FullMeetView))
                        Icon(
                          Icons.emoji_events,
                          size: 20,
                          color: markerColor,
                        ),
                      if (events.any((event) => event is TrainingView))
                        Icon(
                          Icons.run_circle_outlined,
                          size: 16,
                          color: markerColor,
                        ),
                      if (events.any((event) => event is SimpleAthleteView))
                        Icon(
                          Icons.cake_outlined,
                          size: 16,
                          color: markerColor,
                        ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
              dowBuilder: (context, day) {
                if (day.weekday == DateTime.sunday ||
                    day.weekday == DateTime.saturday) {
                  final text = DateFormat.E(
                    AppLocalizations.of(context)!.localeName,
                  ).format(day);
                  return Center(
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return null;
              },
              defaultBuilder: (context, day, focusedDay) {
                final isHoliday =
                    holidays.contains(DateTime(1993, day.month, day.day)) ||
                        easterHolidays
                            .contains(DateTime(day.year, day.month, day.day));
                if (isHoliday) {
                  return Center(
                    child: Text(
                      DateFormat.d(AppLocalizations.of(context)!.localeName)
                          .format(day),
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  );
                }
                return null;
              },
            ),
            eventLoader: (day) {
              // return events.value with the same day
              return events.value.where((event) {
                if (event is FullMeetView) {
                  return TimeHelper.isSameDay(event.meet.startAt, day) ||
                      (event.isMultiDay &&
                          event.meet.endAt.isAfter(day) &&
                          event.meet.startAt.isBefore(day));
                } else if (event is TrainingView) {
                  return TimeHelper.isSameDay(event.training.datetime, day);
                } else if (event is SimpleAthleteView) {
                  return TimeHelper.isSameDay(event.birthDay(day.year), day);
                }
                return false;
              }).toList();
            },
            onHeaderTapped: (focusedDay) {
              selected.value = DateTime.now();
            },
          ),
          const Divider(),
          // show events for selected day

          ...events.value.map(
            (event) {
              // filter out events that are not for the selected day
              if (event is FullMeetView) {
                if (!TimeHelper.isSameDay(event.meet.startAt, selected.value) &&
                    !(event.isMultiDay &&
                        event.meet.endAt.isAfter(selected.value) &&
                        event.meet.startAt.isBefore(selected.value))) {
                  return const SizedBox.shrink();
                }
                isEventForDayHelper = true;
                return MeetTile(meet: event);
              } else if (event is TrainingView) {
                if (!TimeHelper.isSameDay(
                    event.training.datetime, selected.value)) {
                  return const SizedBox.shrink();
                }
                isEventForDayHelper = true;
                return TrainingTile(training: event);
              } else if (event is SimpleAthleteView) {
                if (!TimeHelper.isSameDay(
                    event.birthDay(selected.value.year), selected.value)) {
                  return const SizedBox.shrink();
                }
                isEventForDayHelper = true;
                return ListTile(
                  leading: const Icon(Icons.cake_outlined),
                  title: Text(
                      '${event.fullName} (${selected.value.year - event.birthDate.year})'),
                  // subtitle: Text(
                  //   AppLocalizations.of(context)!.birthdayOnDate(
                  //     TimeHelper.getFullDateWithoutTime(
                  //         event.birthDay(selected.value.year), context),
                  //   ),
                  // ),
                );
              }
              throw Exception(
                'Unknown event type: ${event.runtimeType}',
              );
            },
          ),
          if (!isEventForDayHelper)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.noEventsForSelectedDay +
                    TimeHelper.getFullDateWithoutTime(selected.value, context),
                style: const TextStyle(fontSize: 16),
              ),
            ),
        ],
      ),
    );
  }
}
