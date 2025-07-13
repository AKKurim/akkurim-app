import 'package:ak_kurim_app/models/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../services/auth/auth_service.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../widgets/settings/locale_dropdown.dart';
import '../models/auth/progress_enum.dart';
import '../providers/app_settings_provider.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  void showFingerprintPromptDelay(
    BuildContext context,
    WidgetRef ref,
    Duration delay,
    AuthState? authData,
  ) async {
    await Future.delayed(delay);
    if (!context.mounted ||
        (authData != null && authData.state != ProgressEnum.initial)) {
      return;
    }
    final authService = ref.read(authServiceProvider.notifier);
    await authService.promptForBiometricLogin(
      localizedReason: AppLocalizations.of(context)!.loginWithFingerprint,
      androidTitle: AppLocalizations.of(context)!.loginWithFingerprintAndroid,
      cancelButton: AppLocalizations.of(context)!.cancelButton,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    var showPaassword = useState(false);
    final authData = ref.watch(authServiceProvider).maybeWhen(
          data: (value) => value,
          orElse: () => null,
        );

    ref.listen(authServiceProvider, (previous, next) {
      if (next.value?.state == ProgressEnum.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                next.value?.error ?? AppLocalizations.of(context)!.loginFailed),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
    final appSettings = ref.watch(appSettingsPProvider).maybeWhen(
          data: (value) => value,
          orElse: () => null,
        );
    showFingerprintPromptDelay(
        context, ref, const Duration(milliseconds: 500), authData);

    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [LocaleDropdown()],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.email,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: passwordController,
                        obscureText: !showPaassword.value,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.password,
                          // hide the password input
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showPaassword.value = !showPaassword.value;
                      },
                      icon: Icon(
                        showPaassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.green),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        ref.read(authServiceProvider.notifier).login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      },
                      child: Text(AppLocalizations.of(context)!.login,
                          style: const TextStyle(fontSize: 18)),
                    ),
                    if (appSettings?.useFingerprint == true)
                      IconButton(
                        icon: const Icon(Icons.fingerprint, size: 32),
                        onPressed: () {
                          showFingerprintPromptDelay(context, ref,
                              const Duration(seconds: 0), authData);
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (authData?.state == ProgressEnum.loading)
            Container(
              color: Colors.black.withValues(alpha: 0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
