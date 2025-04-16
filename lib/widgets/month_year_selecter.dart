import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/meet_providers.dart';
import '../utils/utils.dart';

class MonthYearSelecter extends ConsumerWidget {
  const MonthYearSelecter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedMonthYearPProvider);
    return Row(
      children: [
        IconButton(
            onPressed: () {
              ref.read(selectedMonthYearPProvider.notifier).previousMonth();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        const Spacer(),
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
        const Spacer(),
        IconButton(
            onPressed: () {
              ref.read(selectedMonthYearPProvider.notifier).nextMonth();
            },
            icon: const Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}
