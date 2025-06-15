import 'package:flutter/material.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import 'locale_dropdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/app_settings_provider.dart';

class LocaleSelectionRow extends ConsumerWidget {
  const LocaleSelectionRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsPProvider);

    return appSettings.when(
      data: (appSettings) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.titleLarge),
            Expanded(child: Container()),
            LocaleDropdown(),
          ],
        ),
      ),
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
