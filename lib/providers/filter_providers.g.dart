// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$athleteStatusesHash() => r'e67545eeef95219793e6766d23f45826d2f53bd3';

/// See also [athleteStatuses].
@ProviderFor(athleteStatuses)
final athleteStatusesProvider =
    AutoDisposeStreamProvider<List<String>>.internal(
  athleteStatuses,
  name: r'athleteStatusesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$athleteStatusesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AthleteStatusesRef = AutoDisposeStreamProviderRef<List<String>>;
String _$filteredAthletesHash() => r'62fa9353d321e85328926c81973e2a84db49d090';

/// See also [filteredAthletes].
@ProviderFor(filteredAthletes)
final filteredAthletesProvider =
    AutoDisposeStreamProvider<List<SimpleAthleteView>>.internal(
  filteredAthletes,
  name: r'filteredAthletesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredAthletesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredAthletesRef
    = AutoDisposeStreamProviderRef<List<SimpleAthleteView>>;
String _$showFinishedMeetsHash() => r'90b1d9117e0bf4dab2c5f5bf5adf38fd8b9c28eb';

/// See also [ShowFinishedMeets].
@ProviderFor(ShowFinishedMeets)
final showFinishedMeetsProvider =
    AutoDisposeNotifierProvider<ShowFinishedMeets, bool>.internal(
  ShowFinishedMeets.new,
  name: r'showFinishedMeetsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showFinishedMeetsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowFinishedMeets = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
