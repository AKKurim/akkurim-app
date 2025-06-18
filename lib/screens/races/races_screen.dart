import 'package:ak_kurim_app/models/other/date_range.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/meet_providers.dart';
import '../../models/views/full_meet_view.dart';
import '../../utils/utils.dart';
import '../../widgets/month_year_selecter.dart';

class RacesScreen extends ConsumerWidget {
  const RacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sMY = ref.watch(selectedMonthYearPProvider);
    final List<FullMeetView> meets = ref
        .watch(
          meetProvidersPProvider(
            range: DateRange(
              start: DateTime(sMY.year, sMY.month, 1),
              end: DateTime(sMY.year, sMY.month + 1, 1),
            ),
          ),
        )
        .when(
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
    // todo these two variables should probably be moved to the FullMeetView model as properties (or getters)
    final bool isPast = meet.meet.endAt
        .add(const Duration(minutes: 90))
        .isBefore(DateTime.now());
    final bool isToday =
        TimeHelper.isSameDay(meet.meet.startAt, DateTime.now()) ||
            (meet.isMultiDay &&
                meet.meet.endAt.isAfter(DateTime.now()) &&
                meet.meet.startAt.isBefore(DateTime.now()));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
      child: Column(
        children: [
          if (!isPast)
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  const Icon(Icons.calendar_today),
                  const Icon(Icons.access_time),
                  const SizedBox(width: 8),
                  if (!meet.isMultiDay)
                    Text(
                      TimeHelper.getFullDateWithTime(meet.meet.startAt, context,
                          endTime: meet.meet.endAt),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  if (meet.isMultiDay)
                    Text(
                      '${TimeHelper.getFullDateWithTime(meet.meet.startAt, context)} =>\n${TimeHelper.getFullDateWithTime(meet.meet.endAt, context)}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            )
          else
            const SizedBox.shrink(),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),
            color: isPast
                ? Colors.green[800]
                : isToday
                    ? Colors.orange[800]
                    : null,
            child: ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(meet.meet.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text(meet.athletesCount.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  Icon(Icons.people),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${meet.meet.location?.split(' ')[0]} ${meet.meet.location?.split(' ').skip(1).join(' ')}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  if (meet.meet.organizer != null &&
                      meet.meet.organizer != 'Not found')
                    Text(
                      meet.meet.organizer!,
                      style: const TextStyle(fontSize: 16),
                    ),
                ],
              ),
              onTap: () {
                context.push('/race/${meet.meet.id}/${isPast ? 2 : 0}',
                    extra: meet); // Pass the meet object to the next screen
              },
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
