import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/settings/locale_selection_row.dart';
import '../widgets/settings/theme_mode_row.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settings)),
      body: Column(
        children: const [
          ThemeModeRow(),
          LocaleSelectionRow(),
        ],
      ),
    );
  }
}
