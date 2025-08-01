import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/views/simple_athlete_view.dart';
import 'package:diacritic/diacritic.dart';
import 'simple_athletes_provider.dart';

part 'filter_providers.g.dart';

final showFiltersProvider = StateProvider<bool>((ref) => false);
final searchProvider = StateProvider<String>((ref) => '');
final statusFilterProvider = StateProvider<Set<String>>((ref) => {});

@riverpod
Stream<List<String>> athleteStatuses(Ref ref) async* {
  yield ['active', 'pending ', 'inactive', 'archived'];
}

@riverpod
Stream<List<SimpleAthleteView>> filteredAthletes(Ref ref) async* {
  final search = removeDiacritics(ref.watch(searchProvider)).toLowerCase();
  final statusFilter = ref.watch(statusFilterProvider);
  final athletes = ref.watch(simpleAthletesPProvider);

  yield* athletes.maybeWhen(orElse: () async* {
    yield [];
  }, data: (data) async* {
    // data is List<SimpleAthleteView>
    data = data.where((athlete) {
      return (removeDiacritics(
                      '${athlete.athlete.firstName} ${athlete.athlete.lastName}')
                  .toLowerCase()
                  .contains(search) ||
              removeDiacritics(
                      '${athlete.athlete.lastName} ${athlete.athlete.firstName}')
                  .toLowerCase()
                  .contains(search)) &&
          (statusFilter.isEmpty ||
              statusFilter.any((status) => status == athlete.athlete.status));
    }).toList();
    // Sort the data by first name and last name
    data.sort((a, b) {
      final aName =
          removeDiacritics('${a.athlete.lastName} ${a.athlete.firstName}');
      final bName =
          removeDiacritics('${b.athlete.lastName} ${b.athlete.firstName}');
      return aName.compareTo(bName);
    }); // TODO add sorting selection
    yield data;
  });
}

@riverpod
class ShowFinishedMeets extends _$ShowFinishedMeets {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}
