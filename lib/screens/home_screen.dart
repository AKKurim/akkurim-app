import 'package:ak_kurim_app/models/views/simple_athlete_view.dart';
import 'package:ak_kurim_app/providers/simple_athletes_provider.dart';
import 'package:ak_kurim_app/screens/races/races_screen.dart';
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
    final selected = useState(DateTime.now());
    final showBirthdays = useState(false);

    //final trainings = ref.watch(trainingsPProvider);
    //final meets = ref.watch(meetProvidersPProvider);
    List<SimpleAthleteView> athletes = ref.watch(simpleAthletesPProvider).when(
        data: (athletes) => athletes,
        error: (error, stackTrace) => [],
        loading: () => []);

    final remoteConfig = ref.watch(remoteConfigProvider);
    final bool isNewUpdateAvailable = ref
        .watch(newUpdateProvider)
        .maybeWhen(data: (data) => data, orElse: () => false);
    return RefreshIndicator(
      onRefresh: () async {
        selected.value = DateTime.now();
      },
      child: Column(
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
          else
            const SizedBox(),
          TableCalendar(
            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.now().add(const Duration(days: 365 * 2)),
            focusedDay: selected.value,
            locale: AppLocalizations.of(context)!.localeName,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarFormat: CalendarFormat.week,
            availableCalendarFormats: const {
              CalendarFormat.week: '',
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronIcon: Icon(Icons.chevron_left),
              rightChevronIcon: Icon(Icons.chevron_right),
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              weekendTextStyle: const TextStyle(color: Colors.red),
            ),
            selectedDayPredicate: (day) => isSameDay(day, DateTime.now()),
            onPageChanged: (focusedDay) => selected.value = focusedDay,
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                if (events.isNotEmpty) {
                  return Badge.count(
                    count: events.length,
                    child: const Icon(
                      Icons.cake,
                      color: Colors.white,
                      size: 20,
                    ),
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
              // I want to change the color of the dates (weekend dates) to red
              defaultBuilder: (context, day, focusedDay) {
                final isHoliday = Config.holidays
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
            eventLoader: (day) => athletes
                .where((athlete) =>
                    showBirthdays.value &&
                    athlete.athleteStatus.name == 'Active' &&
                    athlete.birthDate.month == day.month &&
                    athlete.birthDate.day == day.day)
                .toList(),
            onDaySelected: (selectedDay, focusedDay) {
              final birthdayAthletes = athletes.where((athlete) =>
                  athlete.birthDate.month == selectedDay.month &&
                  athlete.birthDate.day == selectedDay.day);
              if (birthdayAthletes.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'birthdays on ${selectedDay.day}. ${selectedDay.month}.',
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: birthdayAthletes
                          .map((athlete) => Text(athlete.fullName +
                              (athlete.birthDate.year != 0
                                  ? ' (${DateTime.now().year - athlete.birthDate.year})'
                                  : '')))
                          .toList(),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('ok'),
                      ),
                    ],
                  ),
                );
              }
            },
            // is there a on title tap event?
            onHeaderTapped: (focusedDay) {
              selected.value = DateTime.now();
            },
          ),
          const SizedBox(height: 20),
          // toggle for showing birthdays
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              Text(AppLocalizations.of(context)!.showBirthdays,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const Icon(Icons.cake),
              Spacer(),
              Switch(
                value: showBirthdays.value,
                onChanged: (value) {
                  showBirthdays.value = value;
                },
              ),
              const SizedBox(width: 16),
            ],
          ),
          const Divider(),
          Text(selected.value.toIso8601String()),
          for (int i = 0; i < 10; i++) const Text('Filler'),
        ],
      ),
    );
  }
}
