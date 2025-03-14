import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils/config.dart';
import '../../providers/app_settings_provider.dart';

class ThemeModeSwitch extends ConsumerWidget {
  const ThemeModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsPProvider);
    // use the slider to switch between light and dark mode
    return Switch(
      value: appSettings.maybeWhen(
          data: (appSettings) => appSettings.themeData == Config.darkTheme,
          orElse: () => true),
      onChanged: (value) {
        ref
            .read(appSettingsPProvider.notifier)
            .updateThemeMode(value ? "dark" : "light");
      },
    );
  }
}
