import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../screens/_main_screen_manager.dart';
import '../services/auth/auth_service.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../widgets/settings/locale_dropdown.dart';
import '../models/auth/progress_enum.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    var showPaassword = useState(false);

    ref.listen(authServiceProvider, (previous, next) {
      if (next.state == ProgressEnum.initial) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      } else if (next.state == ProgressEnum.authenticated) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MainScreenManager(),
          ),
        );
      } else if (next.state == ProgressEnum.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(next.error ?? AppLocalizations.of(context)!.loginFailed),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

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
                  child: Text(AppLocalizations.of(context)!.login),
                ),
              ],
            ),
          ),
          if (ref.watch(authServiceProvider).state == ProgressEnum.loading)
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
