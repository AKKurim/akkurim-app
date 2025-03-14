import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/app_settings_provider.dart';
import '../../l10n/supported_localizations.dart';

class LocaleDropdown extends ConsumerWidget {
  const LocaleDropdown({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsPProvider);

    return appSettings.when(
      data: (appSettings) => DropdownButton(
        value: appSettings.locale,
        items: SupportedLocalizations.supportedLocales
            .map((locale) => DropdownMenuItem(
                  value: locale,
                  child: Text(locale.languageCode.toUpperCase()),
                ))
            .toList(),
        onChanged: (Locale? locale) {
          ref
              .read(appSettingsPProvider.notifier)
              .updateLocale(locale!.languageCode);
        },
      ),
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
