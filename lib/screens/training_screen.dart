import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class TrainingScreen extends ConsumerWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Theme.of(context).colorScheme.primary,
            tabs: const [
              Tab(text: 'Info'),
              Tab(text: 'Groups'),
              Tab(text: 'Performance'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Text('TODO: Trainings'),
                Text('TODO: Guardians'),
                Text('TODO: Performance'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
