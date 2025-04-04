import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/settings/locale_selection_row.dart';
import '../widgets/settings/theme_mode_row.dart';
import '../services/auth/auth_service.dart';
import '../screens/login_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsScreenTitle),
        actions: [
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
                        ref.read(authServiceProvider.notifier).logout();
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
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
          ThemeModeRow(),
          LocaleSelectionRow(),
        ],
      ),
    );
  }
}
