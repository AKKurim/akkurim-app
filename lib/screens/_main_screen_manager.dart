import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../screens/home_screen.dart';
import 'training_screen.dart';
import '../screens/screen_2.dart';
import '../screens/screen_3.dart';
import 'member_screen.dart';
import '../screens/settings_screen.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../widgets/sync_icon.dart';
import '../providers/simple_athletes_provider.dart';
import '../providers/trainer_provider.dart';

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
      TrainingScreen(
        tabController: tabController,
      ),
      const Screen2(),
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
      AppLocalizations.of(context)!.screen1Title,
      AppLocalizations.of(context)!.screen2Title,
      AppLocalizations.of(context)!.eventsScreenTitle,
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
        icon: const Icon(Icons.screen_share, color: Colors.transparent),
        label: AppLocalizations.of(context)!.screen1Title,
      ),
      NavigationDestination(
        icon: const Icon(Icons.screen_share, color: Colors.transparent),
        label: AppLocalizations.of(context)!.screen2Title,
      ),
      NavigationDestination(
        icon: const Icon(Icons.event_outlined),
        selectedIcon: const Icon(Icons.event),
        label: AppLocalizations.of(context)!.eventsScreenTitle,
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
                  Tab(text: 'Performance'),
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
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
            print("Selected index: $currentIndex");
          });
        },
        destinations: bottomNavigationBarItems,
      ),
    );
  }
}
