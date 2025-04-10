import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ak_kurim_app/l10n/app_localizations.dart';
import '../providers/simple_athlete_provider.dart';
import '../utils/utils.dart';
import 'package:diacritic/diacritic.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

class MemberScreen extends HookConsumerWidget {
  const MemberScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simpleAthlete = ref.watch(simpleAthletePProvider);
    var showFilters = useState(false);
    final searchController = useTextEditingController();

    useEffect(() {
      void listener() {
        final text = searchController.text;
        ref.read(searchQueryProvider.notifier).state = text;
      }

      searchController.addListener(listener);
      return () => searchController.removeListener(listener);
    }, [searchController]);
    final search = ref.watch(searchQueryProvider).toLowerCase();

    return simpleAthlete.maybeWhen(orElse: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }, data: (data) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                controller: searchController,
                hintText: AppLocalizations.of(context)!.memberSearchHint,
                onChanged: (value) => null,
                trailing: [
                  IconButton(
                    icon: Icon(showFilters.value
                        ? Icons.expand_less
                        : Icons.filter_list),
                    onPressed: () => showFilters.value = !showFilters.value,
                  )
                ],
              ),
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 200),
              child: showFilters.value
                  ? Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Add filter options here
                          Text('test filter option 1'),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final athlete = data[index];
                  if (search.isNotEmpty) {
                    if (!removeDiacritics(
                                '${athlete.athlete.firstName} ${athlete.athlete.lastName}')
                            .toLowerCase()
                            .contains(
                              removeDiacritics(search),
                            ) &&
                        !removeDiacritics(
                                '${athlete.athlete.lastName} ${athlete.athlete.firstName}')
                            .toLowerCase()
                            .contains(
                              removeDiacritics(search),
                            )) {
                      return const SizedBox.shrink();
                    }
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            '${athlete.athlete.firstName} ${athlete.athlete.lastName} (${Utils.parseBirthNumber(athlete.athlete.birthNumber).year.toString()})',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                      trailing: Chip(
                        label: Text('Active'),
                        backgroundColor: Colors.green.withValues(alpha: 0.2),
                        labelStyle: TextStyle(color: Colors.green),
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: Theme.of(context).dividerColor,
                          width: 0.5,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }, error: (error, stackTrace) {
      return Center(
        child: Text(
          error.toString(),
          style: const TextStyle(color: Colors.red),
        ),
      );
    });
  }
}
