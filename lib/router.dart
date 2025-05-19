import 'package:ak_kurim_app/screens/member/member_profile.dart';
import 'package:ak_kurim_app/screens/storage/add_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import './utils/utils.dart';
import './providers/remote_config_provider.dart';
import './services/auth/auth_service.dart';
import '../models/auth/progress_enum.dart';
import './screens/login_screen.dart';
import './providers/package_info_provider.dart';
import './screens/force_update_screen.dart';
import './screens/home_screen.dart';
import './screens/storage/storage_screen.dart';
import './screens/member/member_screen.dart';
import './screens/races/races_screen.dart';
import './screens/splash_screen.dart';
import './screens/attendance_tresults/_attendance_screen_manager.dart';
import './screens/_scaffold_with_navbar.dart';
import 'screens/member/member_edit_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/races/race_screen.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  final auth = ref.watch(authServiceProvider);
  final remoteConfig = ref.watch(remoteConfigProvider);
  final packageInfo = ref.watch(packageInfoProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/home',
    redirect: (context, state) {
      final location = state.uri.toString();

      // Wait for remote config to load
      if (remoteConfig is AsyncLoading || packageInfo is AsyncLoading) {
        return '/splash';
      }

      // Check version first
      final remoteData = remoteConfig.asData?.value;
      final packageInfoData = packageInfo.asData?.value;

      final appVersionOk = Utils.ensureMinimumVersion(
        currentVersion: packageInfoData?.version ?? '',
        minimumVersion: remoteData?.minimumAppVersion ?? '',
      );
      if (!appVersionOk && location != '/force-update') {
        return '/force-update';
      }

      // Auth redirects
      final loggingIn = location.startsWith('/login');
      if (auth.state != ProgressEnum.authenticated) {
        return loggingIn ? null : '/login';
      } else {
        return loggingIn ? '/home' : null;
      }
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/force-update',
        name: 'force-update',
        builder: (context, state) => ForceUpdateScreen(
          currentAppVersion: packageInfo.asData!.value.version,
          minimumAppVersion: remoteConfig.asData!.value.minimumAppVersion,
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/attendance',
                name: 'attendance',
                builder: (context, state) => AttendanceScreenManager(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/races',
                name: 'races',
                builder: (context, state) => RacesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/storage',
                name: 'storage',
                builder: (context, state) => StorageScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/members',
                name: 'members',
                builder: (context, state) => MemberScreen(),
              ),
            ],
          )
        ],
      ),
      GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) {
            return const SettingsScreen();
          }),
      GoRoute(
          path: '/race/:id/:tabIndex',
          name: 'race',
          builder: (context, state) {
            final String id = state.pathParameters['id'] ?? '';
            final int tabIndex =
                int.tryParse(state.pathParameters['tabIndex'] ?? '0') ?? 0;
            return RaceScreen(
              meetId: id,
              initialIndex: tabIndex,
            );
          }),
      GoRoute(
        path: '/item-create',
        name: 'item-create',
        builder: (context, state) {
          return const AddItemScreen();
        },
      ),
      GoRoute(
        path: '/member/:id',
        name: 'member-detail',
        builder: (context, state) {
          final String id = state.pathParameters['id'] ?? '';
          return MemberProfile(athleteId: id);
        },
        routes: [
          GoRoute(
            path: '/edit',
            name: 'member-edit',
            builder: (context, state) {
              final String? id = state.pathParameters['id'];
              return MemberEditScreen(
                athleteId: id,
                editMode: true,
              );
            },
          ),
          GoRoute(
              path: '/new',
              name: 'member-new',
              builder: (context, state) {
                return MemberEditScreen(
                  athleteId: null,
                  editMode: false,
                );
              }),
        ],
      )
    ],
  );
}
