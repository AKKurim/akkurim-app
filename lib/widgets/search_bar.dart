import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/filter_providers.dart';
import '../l10n/app_localizations.dart';

class MySearchBar extends HookConsumerWidget {
  const MySearchBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var showFilters = ref.watch(showFiltersProvider);
    final searchController = useTextEditingController();

    Timer? debounceTimer;
    useEffect(() {
      void listener() {
        debounceTimer?.cancel();

        debounceTimer = Timer(
          const Duration(milliseconds: 300),
          () {
            // Cancel the timer if the text is empty
            if (searchController.text.isEmpty) {
              ref.read(searchProvider.notifier).state = '';
              return;
            }
            // Update the search provider with the current text
            ref.read(searchProvider.notifier).state = searchController.text;
          },
        );
      }

      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, [searchController]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: SearchBar(
        controller: searchController,
        hintText: AppLocalizations.of(context)!.memberSearchHint,
        trailing: [
          IconButton(
            icon: Icon(showFilters ? Icons.expand_less : Icons.filter_list),
            onPressed: () =>
                ref.read(showFiltersProvider.notifier).state = !showFilters,
          )
        ],
      ),
    );
  }
}
