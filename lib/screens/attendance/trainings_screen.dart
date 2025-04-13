import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class TrainingsScreen extends ConsumerWidget {
  const TrainingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      'Trainings Screen',
      style: TextStyle(fontSize: 24),
    );
  }
}
