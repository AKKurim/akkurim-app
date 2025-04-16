import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../providers/meet_providers.dart';
import '../models/views/full_meet_view.dart';
import './race_screen.dart';
import '../utils/utils.dart';
import '../widgets/month_year_selecter.dart';

class RacesScreen extends ConsumerWidget {
  const RacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<FullMeetView> meets = ref.watch(meetProvidersPProvider).when(
          data: (data) => data,
          error: (error, stackTrace) =>
              throw Exception('Error loading meets: $error, $stackTrace'),
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      child: ListTile(
                        title: Text(meet.meet.name),
                        subtitle: Text(
                          '${TimeHelper.getDayMonthYear(meet.meet.startAt)} (${TimeHelper.getMinHourFromDateTime(meet.meet.startAt)} - ${TimeHelper.getMinHourFromDateTime(meet.meet.endAt)})',
                          style: const TextStyle(fontSize: 16),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RaceScreen(meet: meet),
                            ),
                          );
                        },
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
            ),
          ],
        ),
      ),
    );
  }
}
