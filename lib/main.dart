import 'package:ak_kurim_app/config.dart';
import 'package:flutter/material.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'l10n/supported_localizations.dart';
import 'providers/app_settings_provider.dart';
import 'services/network/api_service.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:terminate_restart/terminate_restart.dart';
import './router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ApiService.instance.configureDio(baseUrl: Config.baseUrl);
  TerminateRestart.instance.initialize();

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
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: Config.appName,
      debugShowCheckedModeBanner: true,
      routerConfig: router,
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
    );
  }
}
