import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'trainings_screen.dart';
import 'groups_screen.dart';
import 'training_results_screen.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../../providers/tab_index_provider.dart';

class AttendanceScreenManager extends ConsumerStatefulWidget {
  const AttendanceScreenManager({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AttendanceScreenManagerState();
}

class _AttendanceScreenManagerState
    extends ConsumerState<AttendanceScreenManager>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      ref.read(tabIndexPProvider.notifier).setIndex(_tabController.index);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).colorScheme.primary,
          tabs: [
            Tab(text: AppLocalizations.of(context)!.trainingTab1),
            Tab(text: AppLocalizations.of(context)!.trainingTab2),
            Tab(text: AppLocalizations.of(context)!.trainingTab3),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              TrainingsScreen(),
              GroupsScreen(),
              TrainingResultsScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
