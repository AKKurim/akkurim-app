import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../services/auth/auth_service.dart';

class InfoRow extends ConsumerWidget {
  const InfoRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authServiceProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(authState.email ?? 'No email'),
              const Spacer(),
              Text(authState.tenant?.toUpperCase() ?? 'NO TENANT'),
            ],
          ),
          Row(
            children: [
              Text(authState.state.name),
              const Spacer(),
              Text(authState.roles.map((e) => e.name).join(', ')),
            ],
          )
        ],
      ),
    );
  }
}
