import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/views/group_view.dart';

class AddGroupScreen extends ConsumerStatefulWidget {
  final GroupView groupView;
  final bool editMode;
  const AddGroupScreen({
    super.key,
    required this.groupView,
    required this.editMode,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddGroupScreenState();
}

class _AddGroupScreenState extends ConsumerState<AddGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Group'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              // Save group logic TODO
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Group Name'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add group logic
              },
              child: const Text('Add Group'),
            ),
          ],
        ),
      ),
    );
  }
}
