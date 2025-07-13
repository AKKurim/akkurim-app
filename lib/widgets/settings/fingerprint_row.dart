import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/app_settings_provider.dart';
import '../../l10n/app_localizations.dart';
import '../../services/auth/auth_service.dart';

class FingerprintRow extends ConsumerWidget {
  const FingerprintRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsPProvider).maybeWhen(
          data: (value) => value,
          orElse: () => null,
        );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppLocalizations.of(context)!.useFingerprintSettings,
              style: Theme.of(context).textTheme.titleLarge),
          const Icon(Icons.fingerprint, size: 32),
          const Spacer(),
          Switch(
            value: appSettings?.useFingerprint ?? false,
            onChanged: (value) {
              if (!value) {
                ref
                    .read(appSettingsPProvider.notifier)
                    .updateUseFingerprint(value);
                return;
              }
              ref.read(authServiceProvider.notifier).promptForBiometricSave(
                    localizedReason:
                        AppLocalizations.of(context)!.saveFingerprintLogin,
                    androidTitle:
                        AppLocalizations.of(context)!.useFingerprintAndroid,
                    cancelButton: AppLocalizations.of(context)!.cancelButton,
                    fromSettings: true,
                  );
            },
          ),
        ],
      ),
    );
  }
}
