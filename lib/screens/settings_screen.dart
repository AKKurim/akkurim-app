import 'package:flutter/material.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/settings/locale_selection_row.dart';
import '../widgets/settings/theme_mode_row.dart';
import '../widgets/settings/info_row.dart';
import '../services/auth/auth_service.dart';
import '../providers/package_info_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsScreenTitle),
        actions: [
          IconButton(
              icon: const Icon(Icons.help),
              onPressed: () {
                final info = ref.read(packageInfoProvider);
                final appName = info.whenData((value) => value.appName);
                final version = info.whenData((value) => value.version);
                showAboutDialog(
                  context: context,
                  applicationName: appName.value,
                  applicationVersion: version.value,
                  applicationLegalese: "© 2025 Tajovský Matěj",
                  applicationIcon: const Icon(Icons.info),
                );
              }),
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => AlertDialog(
                  title: Text(AppLocalizations.of(context)!.logout),
                  content:
                      Text(AppLocalizations.of(context)!.logoutConfirmation),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ref.read(authServiceProvider.notifier).logout();
                      },
                      child: Text(AppLocalizations.of(context)!.confirmButton),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(AppLocalizations.of(context)!.cancelButton),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: const [
          InfoRow(),
          Divider(),
          ThemeModeRow(),
          LocaleSelectionRow(),
        ],
      ),
    );
  }
}
