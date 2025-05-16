import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/meet_providers.dart';
import '../../models/views/full_meet_view.dart';
import 'race_screen.dart';
import '../../utils/utils.dart';
import '../../widgets/month_year_selecter.dart';

class RacesScreen extends ConsumerWidget {
  const RacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<FullMeetView> meets = ref.watch(meetProvidersPProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => throw error,
          loading: () => [],
        );
    return RefreshIndicator(
      onRefresh: () async {
        DateTime now = DateTime.now();
        ref
            .read(selectedMonthYearPProvider.notifier)
            .setMonthAndYear(now.month, now.year);
      },
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            ref.read(selectedMonthYearPProvider.notifier).previousMonth();
          } else if (details.velocity.pixelsPerSecond.dx < 0) {
            ref.read(selectedMonthYearPProvider.notifier).nextMonth();
          }
        },
        child: Column(
          children: [
            MonthYearSelecter(),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                  itemCount: meets.length,
                  itemBuilder: (context, index) {
                    final meet = meets[index];
                    return MeetTile(meet: meet);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class MeetTile extends StatelessWidget {
  const MeetTile({
    super.key,
    required this.meet,
  });

  final FullMeetView meet;

  @override
  Widget build(BuildContext context) {
    final bool isPast = meet.meet.startAt.isBefore(DateTime.now()) &&
        !TimeHelper.isSameDay(meet.meet.startAt, DateTime.now());
    final bool isToday =
        TimeHelper.isSameDay(meet.meet.startAt, DateTime.now());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Column(
        children: [
          !isPast
              ? Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(Icons.calendar_today),
                    const Icon(Icons.access_time),
                    const SizedBox(width: 8),
                    Text(
                        '${TimeHelper.getWeekDayName(meet.meet.startAt, context)} ${TimeHelper.getDayMonthYear(meet.meet.startAt)} (${TimeHelper.getMinHourFromDateTime(meet.meet.startAt)} - ${TimeHelper.getMinHourFromDateTime(meet.meet.endAt)})',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                )
              : const SizedBox.shrink(),
          !isPast ? const SizedBox(height: 4) : const SizedBox.shrink(),
          ListTile(
            title: Text(meet.meet.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(
              '${meet.meet.location?.split(' ')[0]}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(meet.athletesCount.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                Icon(Icons.people),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RaceScreen(meet: meet),
                ),
              );
            },
            tileColor: isPast
                ? Colors.green[800]
                : isToday
                    ? Colors.orange[800]
                    : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
