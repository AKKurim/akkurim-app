import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../screens/home_screen.dart';
import '../screens/screen_1.dart';
import '../screens/screen_2.dart';
import '../screens/screen_3.dart';
import '../screens/screen_4.dart';
import '../screens/settings_screen.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class MainScreenManager extends HookWidget {
  const MainScreenManager({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const Screen1(),
      const Screen2(),
      const Screen3(),
      const Screen4(),
    ];
    final List<String> titles = [
      AppLocalizations.of(context)!.homeScreenTitle("TODO"),
      AppLocalizations.of(context)!.screen1Title,
      AppLocalizations.of(context)!.screen2Title,
      AppLocalizations.of(context)!.eventsScreenTitle,
      AppLocalizations.of(context)!.membersScreenTitle(2),
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
    var currentIndex = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex.value]),
        actions: [
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
