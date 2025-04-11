// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$athleteStatusesHash() => r'a9614be1138a3472b33ce339f04b23414c0f9b24';

/// See also [athleteStatuses].
@ProviderFor(athleteStatuses)
final athleteStatusesProvider =
    AutoDisposeStreamProvider<List<AthleteStatusData>>.internal(
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
typedef AthleteStatusesRef
    = AutoDisposeStreamProviderRef<List<AthleteStatusData>>;
String _$filteredAthletesHash() => r'e83706d5f2670609fcf1cfcab9372fa057e0fb71';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
