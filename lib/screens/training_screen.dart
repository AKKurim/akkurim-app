import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';

class TrainingScreen extends StatelessWidget {
  final TabController tabController;

  const TrainingScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: const [
        Text(
          'Training Screen',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          'Training Groups',
          style: TextStyle(fontSize: 24),
        ),
        Text(
          'Measurements',
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
