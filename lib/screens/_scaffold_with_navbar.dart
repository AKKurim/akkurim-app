import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../providers/simple_athletes_provider.dart';
import '../providers/trainer_provider.dart';
import 'package:ak_kurim_app/models/views/group_view.dart';
import '../widgets/sync_icon.dart';

import 'attendance_tresults/add_group_screen.dart';
import '../models/views/trainer_view.dart';
import 'attendance_tresults/trainings_screen.dart';
import 'attendance_tresults/training_results_screen.dart';
import '../services/auth/auth_service.dart';
import '../models/auth/role_enum.dart';
import '../providers/tab_index_provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class ScaffoldWithNavBar extends ConsumerWidget {
  const ScaffoldWithNavBar({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // request notification permission
    OneSignal.Notifications.requestPermission(false).then((value) {
      if (OneSignal.Notifications.permission) {
        OneSignal.Notifications.addClickListener((event) {
          final url = event.notification.launchUrl;
          if (url != null) {
            final uri = Uri.parse(url);
            final String path = '/${uri.toString().split('//')[1]}';
            GoRouter.of(context).go('/home');
            GoRouter.of(context).push(path);
          }
        });
      }
    });

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

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[navigationShell.currentIndex]),
        actions: [
          const SyncIcon(),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push('/settings');
            },
          ),
        ],
      ),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        destinations: [
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
            // I want an icon with a storage box or something similar
            icon: const Icon(Icons.inventory_2_outlined),
            selectedIcon: const Icon(Icons.inventory_2),
            label: AppLocalizations.of(context)!.screen2Title,
          ),
          NavigationDestination(
            icon: const Icon(Icons.people_outline),
            selectedIcon: const Icon(Icons.people),
            label: AppLocalizations.of(context)!.membersNavBar,
          ),
        ],
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onItemTapped,
      ),
      floatingActionButton: buildFab(
          currentIndex: navigationShell.currentIndex,
          context: context,
          ref: ref,
          trainerData: trainerData),
    );
  }

  void _onItemTapped(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }
}

FloatingActionButton? buildFab({
  required int currentIndex,
  required BuildContext context,
  required WidgetRef ref,
  required TrainerView? trainerData,
}) {
  final int tabIndex = ref.watch(tabIndexPProvider);
  return currentIndex == 1 || currentIndex == 3 || currentIndex == 4
      ? FloatingActionButton(
          onPressed: () async {
            switch (currentIndex) {
              case 1:
                switch (tabIndex) {
                  case 0:
                    _openCreateTrainingSheet(context);
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
                    openCreateResultSheet(context);
                    break;
                }
              case 3:
                context.push('/item-create');
              case 4:
                final auth = await ref.read(authServiceProvider.future);
                if (!context.mounted) return;
                if (!auth.roles.contains(RoleEnum.admin)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(AppLocalizations.of(context)!.notAllowed),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                context.push('/member/_/new');
            }
          },
          child: const Icon(Icons.add),
        )
      : null;
}

void _openCreateTrainingSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const CreateTrainingForm(),
  );
}

void openCreateResultSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const CreateTrainingResultForm(),
  );
}
