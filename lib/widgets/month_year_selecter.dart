import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/meet_providers.dart';
import '../providers/filter_providers.dart';
import '../utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MonthYearSelecter extends ConsumerWidget {
  const MonthYearSelecter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedMonthYearPProvider);
    final showFinished = ref.watch(showFinishedMeetsProvider);
    final now = DateTime.now();
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime(selected.year, selected.month),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            ).then((value) {
              if (value != null) {
                ref.read(selectedMonthYearPProvider.notifier).setMonthAndYear(
                      value.month,
                      value.year,
                    );
              }
            });
          },
          child: Text(
            '${Utils.getMonthName(selected.month, context)} ${selected.year}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  ref.read(selectedMonthYearPProvider.notifier).previousMonth();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            Row(
              children: [
                if (now.year == selected.year && now.month == selected.month)
                  IconButton(
                    onPressed: () {
                      ref.read(showFinishedMeetsProvider.notifier).toggle();
                    },
                    icon: Icon(
                      showFinished
                          ? FontAwesomeIcons.flagCheckered
                          : FontAwesomeIcons.flag,
                      color: showFinished ? Colors.green : Colors.grey,
                    ),
                  ),
                IconButton(
                    onPressed: () {
                      ref.read(selectedMonthYearPProvider.notifier).nextMonth();
                    },
                    icon: const Icon(Icons.arrow_forward_ios))
              ],
            ),
          ],
        ),
      ],
    );
  }
}
