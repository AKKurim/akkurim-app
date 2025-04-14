import 'package:ak_kurim_app/models/views/group_view.dart';
import 'package:ak_kurim_app/screens/attendance/add_group_screen.dart';
import 'package:ak_kurim_app/services/database/drift_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import '../../providers/groups_provider.dart';

class GroupsScreen extends ConsumerWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<GroupView> groups = ref.watch(groupsPProvider).when(
        data: (data) => data,
        error: (error, stackTrace) =>
            throw Exception('Error loading groups: $error, $stackTrace'),
        loading: () => []);

    groups.sort((a, b) =>
        a.group.name.toLowerCase().compareTo(b.group.name.toLowerCase()));

    final allGroups = ref.watch(allGroupDataProvider).when(
        data: (data) => data,
        error: (error, stackTrace) => [],
        loading: () => []);
    print(allGroups);

    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const SizedBox(width: 16),
            Text(
              'Your Groups',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: groups.length,
            itemBuilder: (context, index) {
              final group = groups[index];
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text(group.group.name),
                  subtitle: Text(
                    // join the name of the trainers in the group
                    group.trainers
                        .map((trainer) =>
                            '${trainer.simpleAthlete.athlete.lastName} ${trainer.simpleAthlete.athlete.firstName}')
                        .join(', '),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        group.athletes.length.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.group,
                        size: 20,
                      ),
                    ],
                  ),
                  onLongPress: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Delete Group'),
                        content: const Text(
                            'Are you sure you want to delete this group?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(groupsPProvider.notifier)
                                  .deleteGroup(group);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      );
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddGroupScreen(
                          groupView: group,
                          editMode: true,
                        ),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
