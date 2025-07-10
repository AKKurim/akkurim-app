import "package:flutter/material.dart";
import '../models/views/simple_athlete_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BirthdayCard extends ConsumerWidget {
  final SimpleAthleteView athlete;
  final int selectedYear;
  const BirthdayCard(
      {super.key, required this.athlete, required this.selectedYear});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        child: ListTile(
      leading: const Icon(Icons.cake_outlined),
      title: Text(
          '${athlete.fullName} (${selectedYear - athlete.birthDate.year})'),
      // subtitle: Text(
      //   AppLocalizations.of(context)!.birthdayOnDate(
      //     TimeHelper.getFullDateWithoutTime(
      //         athlete.birthDay(selectedYear), context),
      //   ),
      // ),
    ));
  }
}
