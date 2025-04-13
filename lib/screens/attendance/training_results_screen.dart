import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class TrainingResultsScreen extends ConsumerWidget {
  const TrainingResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      'Training Results Screen',
      style: TextStyle(fontSize: 24),
    );
  }
}
