import 'package:flutter/material.dart';
import 'trainings_screen.dart';
import 'groups_screen.dart';
import 'training_results_screen.dart';

class AttendanceScreenManager extends StatelessWidget {
  final TabController tabController;

  const AttendanceScreenManager({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: const [
        TrainingsScreen(),
        GroupsScreen(),
        TrainingResultsScreen(),
      ],
    );
  }
}
