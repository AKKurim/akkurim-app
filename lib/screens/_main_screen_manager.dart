import 'package:ak_kurim_app/models/views/group_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../screens/home_screen.dart';
import './attendance_screen_manager.dart';
import './races_screen.dart';
import '../screens/screen_3.dart';
import './member_screen.dart';
import '../screens/settings_screen.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../widgets/sync_icon.dart';
import '../providers/simple_athletes_provider.dart';
import '../providers/trainer_provider.dart';
import '../screens/attendance/add_group_screen.dart';
import '../models/views/trainer_view.dart';

class MainScreenManager extends ConsumerStatefulWidget {
  const MainScreenManager({super.key});

  @override
  ConsumerState<MainScreenManager> createState() => _MainScreenManagerState();
}

class _MainScreenManagerState extends ConsumerState<MainScreenManager>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late final TabController tabController;
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    screens = [
      const HomeScreen(),
      AttendanceScreenManager(
        tabController: tabController,
      ),
      const RacesScreen(),
      const Screen3(),
      const MemberScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final simpleAthlete = ref.watch(simpleAthletesPProvider);
    final trainer = ref.watch(currentTrainerProvider);
    final trainerData = trainer.maybeWhen(
      orElse: () => null,
      data: (data) => data,
    );
    final List<String> titles = [
      AppLocalizations.of(context)!
          .homeScreenTitle(trainerData?.simpleAthlete.athlete.firstName ?? ''),
      AppLocalizations.of(context)!.trainingScreenTitle,
      AppLocalizations.of(context)!.eventsScreenTitle,
      AppLocalizations.of(context)!.screen2Title,
      AppLocalizations.of(context)!.membersScreenTitle(
        simpleAthlete.maybeWhen(
          orElse: () => 0,
          data: (data) => data.length,
        ),
      ),
    ];
    final List<NavigationDestination> bottomNavigationBarItems = [
      NavigationDestination(
        icon: const Icon(Icons.home_outlined),
        selectedIcon: const Icon(Icons.home),
        label: AppLocalizations.of(context)!.homeNavBar,
      ),
      NavigationDestination(
        icon: const Icon(Icons.assignment_outlined),
        selectedIcon: const Icon(Icons.assignment),
        label: AppLocalizations.of(context)!.trainingScreenTitle,
      ),
      NavigationDestination(
        icon: const Icon(Icons.emoji_events_outlined),
        selectedIcon: const Icon(Icons.emoji_events),
        label: AppLocalizations.of(context)!.eventsScreenTitle,
      ),
      NavigationDestination(
        icon: const Icon(Icons.screen_share, color: Colors.transparent),
        label: AppLocalizations.of(context)!.screen2Title,
      ),
      NavigationDestination(
        icon: const Icon(Icons.people_outline),
        selectedIcon: const Icon(Icons.people),
        label: AppLocalizations.of(context)!.membersNavBar,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        bottom: currentIndex == 1
            ? TabBar(
                controller: tabController,
                labelColor: Theme.of(context).colorScheme.primary,
                tabs: const [
                  Tab(text: 'Trainings'),
                  Tab(text: 'Groups'),
                  Tab(text: 'T Results'),
                ],
              )
            : null,
        actions: [
          const SyncIcon(),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      floatingActionButton: buildFab(
        currentIndex: currentIndex,
        tabController: tabController,
        context: context,
        ref: ref,
        trainerData: trainerData,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: bottomNavigationBarItems,
      ),
    );
  }
}

FloatingActionButton? buildFab({
  required int currentIndex,
  required TabController tabController,
  required BuildContext context,
  required WidgetRef ref,
  required TrainerView? trainerData,
}) {
  return currentIndex == 1
      ? FloatingActionButton(
          onPressed: () {
            switch (tabController.index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Placeholder(),
                  ),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddGroupScreen(
                      groupView: GroupView.empty(trainer: trainerData!),
                      editMode: false,
                    ),
                  ),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Placeholder(),
                  ),
                );
                break;
            }
          },
          child: const Icon(Icons.add),
        )
      : null;
}
