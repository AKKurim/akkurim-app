// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meet_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allDisciplinesHash() => r'7c35368626ed255dd8888b719d855d218dd3613e';

/// See also [allDisciplines].
@ProviderFor(allDisciplines)
final allDisciplinesProvider =
    AutoDisposeStreamProvider<List<DisciplineView>>.internal(
  allDisciplines,
  name: r'allDisciplinesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allDisciplinesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllDisciplinesRef = AutoDisposeStreamProviderRef<List<DisciplineView>>;
String _$allCategoriesHash() => r'0754770f5909916ab08f91c449fbea6c42e52065';

/// See also [allCategories].
@ProviderFor(allCategories)
final allCategoriesProvider =
    AutoDisposeStreamProvider<List<CategoryData>>.internal(
  allCategories,
  name: r'allCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllCategoriesRef = AutoDisposeStreamProviderRef<List<CategoryData>>;
String _$meetProvidersPHash() => r'9be62e8e20e4d32f68e834e8809d6268d232b57d';

/// See also [MeetProvidersP].
@ProviderFor(MeetProvidersP)
final meetProvidersPProvider = AutoDisposeStreamNotifierProvider<MeetProvidersP,
    List<FullMeetView>>.internal(
  MeetProvidersP.new,
  name: r'meetProvidersPProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$meetProvidersPHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MeetProvidersP = AutoDisposeStreamNotifier<List<FullMeetView>>;
String _$selectedMonthYearPHash() =>
    r'1bc6458c96a0b7ca721559d07903fef1a0b02a31';

/// See also [selectedMonthYearP].
@ProviderFor(selectedMonthYearP)
final selectedMonthYearPProvider =
    AutoDisposeNotifierProvider<selectedMonthYearP, MonthYearView>.internal(
  selectedMonthYearP.new,
  name: r'selectedMonthYearPProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedMonthYearPHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$selectedMonthYearP = AutoDisposeNotifier<MonthYearView>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
