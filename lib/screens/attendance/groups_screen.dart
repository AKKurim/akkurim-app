import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class GroupsScreen extends ConsumerWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      'Groups Screen',
      style: TextStyle(fontSize: 24),
    );
  }
}
