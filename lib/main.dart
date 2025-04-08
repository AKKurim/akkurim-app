import 'package:ak_kurim_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'l10n/supported_localizations.dart';
import 'providers/app_settings_provider.dart';
import 'screens/_main_screen_manager.dart';
import 'services/network/api_service.dart';
import './services/auth/auth_service.dart';
import './screens/login_screen.dart';
import './models/auth/progress_enum.dart';

void main() async {
  ApiService apiService = ApiService.instance;
  apiService.configureDio(
    baseUrl: Config.baseUrl,
  );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsPProvider);
    final authService = ref.watch(authServiceProvider);

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
      home: appSettings.maybeWhen(
          orElse: () => null,
          data: (appSettings) => authService.state == ProgressEnum.authenticated
              ? const MainScreenManager()
              : const LoginScreen()),
    );
  }
}
