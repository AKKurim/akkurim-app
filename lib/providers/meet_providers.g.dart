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
String _$fullMeetProviderPHash() => r'c96ce9a14cbb24faf7347a9410babcd68869fded';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FullMeetProviderP
    extends BuildlessAutoDisposeStreamNotifier<FullMeetView> {
  late final String meetId;

  Stream<FullMeetView> build({
    required String meetId,
  });
}

/// See also [FullMeetProviderP].
@ProviderFor(FullMeetProviderP)
const fullMeetProviderPProvider = FullMeetProviderPFamily();

/// See also [FullMeetProviderP].
class FullMeetProviderPFamily extends Family<AsyncValue<FullMeetView>> {
  /// See also [FullMeetProviderP].
  const FullMeetProviderPFamily();

  /// See also [FullMeetProviderP].
  FullMeetProviderPProvider call({
    required String meetId,
  }) {
    return FullMeetProviderPProvider(
      meetId: meetId,
    );
  }

  @override
  FullMeetProviderPProvider getProviderOverride(
    covariant FullMeetProviderPProvider provider,
  ) {
    return call(
      meetId: provider.meetId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fullMeetProviderPProvider';
}

/// See also [FullMeetProviderP].
class FullMeetProviderPProvider extends AutoDisposeStreamNotifierProviderImpl<
    FullMeetProviderP, FullMeetView> {
  /// See also [FullMeetProviderP].
  FullMeetProviderPProvider({
    required String meetId,
  }) : this._internal(
          () => FullMeetProviderP()..meetId = meetId,
          from: fullMeetProviderPProvider,
          name: r'fullMeetProviderPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fullMeetProviderPHash,
          dependencies: FullMeetProviderPFamily._dependencies,
          allTransitiveDependencies:
              FullMeetProviderPFamily._allTransitiveDependencies,
          meetId: meetId,
        );

  FullMeetProviderPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.meetId,
  }) : super.internal();

  final String meetId;

  @override
  Stream<FullMeetView> runNotifierBuild(
    covariant FullMeetProviderP notifier,
  ) {
    return notifier.build(
      meetId: meetId,
    );
  }

  @override
  Override overrideWith(FullMeetProviderP Function() create) {
    return ProviderOverride(
      origin: this,
      override: FullMeetProviderPProvider._internal(
        () => create()..meetId = meetId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        meetId: meetId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<FullMeetProviderP, FullMeetView>
      createElement() {
    return _FullMeetProviderPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FullMeetProviderPProvider && other.meetId == meetId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, meetId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FullMeetProviderPRef
    on AutoDisposeStreamNotifierProviderRef<FullMeetView> {
  /// The parameter `meetId` of this provider.
  String get meetId;
}

class _FullMeetProviderPProviderElement
    extends AutoDisposeStreamNotifierProviderElement<FullMeetProviderP,
        FullMeetView> with FullMeetProviderPRef {
  _FullMeetProviderPProviderElement(super.provider);

  @override
  String get meetId => (origin as FullMeetProviderPProvider).meetId;
}

String _$meetProvidersPHash() => r'eef0478d6938a4c9d333667c20ad8a67c9f60a50';

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
    r'2b791b46a03944b61cbb1073e3959165cae36651';

/// See also [SelectedMonthYearP].
@ProviderFor(SelectedMonthYearP)
final selectedMonthYearPProvider =
    AutoDisposeNotifierProvider<SelectedMonthYearP, MonthYearView>.internal(
  SelectedMonthYearP.new,
  name: r'selectedMonthYearPProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedMonthYearPHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedMonthYearP = AutoDisposeNotifier<MonthYearView>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
