import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'theme_mode_switch.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/app_settings_provider.dart';

class ThemeModeRow extends ConsumerWidget {
  const ThemeModeRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsPProvider);

    return appSettings.when(
      data: (appSettings) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.displayMode),
            Expanded(child: Container()),
            const Icon(Icons.light_mode),
            ThemeModeSwitch(),
            const Icon(Icons.dark_mode),
          ],
        ),
      ),
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
