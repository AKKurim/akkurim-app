import 'package:ak_kurim_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'l10n/supported_localizations.dart';
import 'providers/app_settings_provider.dart';
import 'screens/_main_screen_manager.dart';
import 'services/network/api_service.dart';
import './services/auth/auth_service.dart';
import './screens/login_screen.dart';
import './models/auth/progress_enum.dart';
import 'package:package_info_plus/package_info_plus.dart';
import './providers/remote_config_provider.dart';
import './utils/utils.dart';
import './screens/force_update_screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  ApiService apiService = ApiService.instance;
  apiService.configureDio(
    baseUrl: Config.baseUrl,
  );
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ProviderScope(
      child: MyApp(
        packageInfo: packageInfo,
      ),
    ),
  );

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("ca836480-2a6a-4847-a045-1e3098a241f9");
}

class MyApp extends ConsumerWidget {
  final PackageInfo packageInfo;
  const MyApp({super.key, required this.packageInfo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsPProvider);
    final authService = ref.watch(authServiceProvider);
    final remoteConfig = ref.watch(remoteConfigProvider);

    return MaterialApp(
      title: Config.appName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: SupportedLocalizations.supportedLocales,
      locale: appSettings.maybeWhen(
          data: (appSettings) => appSettings.locale, orElse: () => null),
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: appSettings.maybeWhen(
          data: (appSettings) {
            return appSettings.themeData;
          },
          orElse: () => ThemeData.dark()),
      home: remoteConfig.when(
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) {
          return Center(
            child: Text(
              error.toString(),
              style: const TextStyle(color: Colors.red),
            ),
          );
        },
        data: (remoteConfigData) {
          if (Utils.ensureMinimumVersion(
              currentVersion: packageInfo.version,
              minimumVersion: remoteConfigData.minimumAppVersion)) {
            return appSettings.maybeWhen(
                orElse: () => null,
                data: (appSettings) =>
                    authService.state == ProgressEnum.authenticated
                        ? const MainScreenManager()
                        : const LoginScreen());
          } else {
            return ForceUpdateScreen(
              currentAppVersion: packageInfo.version,
              minimumAppVersion: remoteConfigData.minimumAppVersion,
            );
          }
        },
      ),
    );
  }
}
