import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'settings_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final appSettings = ref.watch(appSettingsPProvider);
    var count = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(children: [
          Text(
            AppLocalizations.of(context)!.member(count.value),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          ElevatedButton(
              onPressed: () {
                count.value = 0;
              },
              child: const Text('Reset')),
        ]),
      ),
      floatingActionButton: GestureDetector(
        onLongPress: () {
          count.value = 0;
        },
        child: FloatingActionButton(
          onPressed: () {
            count.value++;
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
