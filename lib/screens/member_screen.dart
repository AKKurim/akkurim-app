import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/search_bar.dart';
import '../widgets/athlete_list_view.dart';
import '../widgets/athlete_filter_options.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

class MemberScreen extends ConsumerWidget {
  const MemberScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          MySearchBar(),
          AthleteFilterOptions(),
          const SizedBox(height: 8),
          Expanded(
            child: AthleteListView(),
          ),
        ],
      ),
    );
  }
}
