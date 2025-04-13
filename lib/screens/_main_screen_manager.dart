import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../screens/home_screen.dart';
import 'training_screen.dart';
import '../screens/screen_2.dart';
import '../screens/screen_3.dart';
import 'member_screen.dart';
import '../screens/settings_screen.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../widgets/sync_icon.dart';
import '../providers/simple_athletes_provider.dart';

class MainScreenManager extends HookConsumerWidget {
  const MainScreenManager({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simpleAthlete = ref.watch(simpleAthletesPProvider);
    var currentIndex = useState(0);

    final List<Widget> screens = [
      const HomeScreen(),
      const TrainingScreen(),
      const Screen2(),
      const Screen3(),
      const MemberScreen(),
    ];
    final List<String> titles = [
      AppLocalizations.of(context)!.homeScreenTitle("TODO change this"),
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
        title: Text(titles[currentIndex.value]),
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
        index: currentIndex.value,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex.value,
        onDestinationSelected: (int index) {
          currentIndex.value = index;
        },
        destinations: bottomNavigationBarItems,
      ),
    );
  }
}
