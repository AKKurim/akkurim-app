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
String _$fullMeetProviderPHash() => r'7dcb1a40da9fd4bf8875c26f1843d3e6774bb907';

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
  late final FullMeetView? preloaded;

  Stream<FullMeetView> build({
    required String meetId,
    FullMeetView? preloaded,
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
    FullMeetView? preloaded,
  }) {
    return FullMeetProviderPProvider(
      meetId: meetId,
      preloaded: preloaded,
    );
  }

  @override
  FullMeetProviderPProvider getProviderOverride(
    covariant FullMeetProviderPProvider provider,
  ) {
    return call(
      meetId: provider.meetId,
      preloaded: provider.preloaded,
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
    FullMeetView? preloaded,
  }) : this._internal(
          () => FullMeetProviderP()
            ..meetId = meetId
            ..preloaded = preloaded,
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
          preloaded: preloaded,
        );

  FullMeetProviderPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.meetId,
    required this.preloaded,
  }) : super.internal();

  final String meetId;
  final FullMeetView? preloaded;

  @override
  Stream<FullMeetView> runNotifierBuild(
    covariant FullMeetProviderP notifier,
  ) {
    return notifier.build(
      meetId: meetId,
      preloaded: preloaded,
    );
  }

  @override
  Override overrideWith(FullMeetProviderP Function() create) {
    return ProviderOverride(
      origin: this,
      override: FullMeetProviderPProvider._internal(
        () => create()
          ..meetId = meetId
          ..preloaded = preloaded,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        meetId: meetId,
        preloaded: preloaded,
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
    return other is FullMeetProviderPProvider &&
        other.meetId == meetId &&
        other.preloaded == preloaded;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, meetId.hashCode);
    hash = _SystemHash.combine(hash, preloaded.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FullMeetProviderPRef
    on AutoDisposeStreamNotifierProviderRef<FullMeetView> {
  /// The parameter `meetId` of this provider.
  String get meetId;

  /// The parameter `preloaded` of this provider.
  FullMeetView? get preloaded;
}

class _FullMeetProviderPProviderElement
    extends AutoDisposeStreamNotifierProviderElement<FullMeetProviderP,
        FullMeetView> with FullMeetProviderPRef {
  _FullMeetProviderPProviderElement(super.provider);

  @override
  String get meetId => (origin as FullMeetProviderPProvider).meetId;
  @override
  FullMeetView? get preloaded =>
      (origin as FullMeetProviderPProvider).preloaded;
}

String _$meetProvidersPHash() => r'8de2c5d0c4aad501e2b8b91bb4f16d0f7adbb457';

abstract class _$MeetProvidersP
    extends BuildlessAutoDisposeStreamNotifier<List<FullMeetView>> {
  late final DateTimeRange<DateTime> range;

  Stream<List<FullMeetView>> build({
    required DateTimeRange<DateTime> range,
  });
}

/// See also [MeetProvidersP].
@ProviderFor(MeetProvidersP)
const meetProvidersPProvider = MeetProvidersPFamily();

/// See also [MeetProvidersP].
class MeetProvidersPFamily extends Family<AsyncValue<List<FullMeetView>>> {
  /// See also [MeetProvidersP].
  const MeetProvidersPFamily();

  /// See also [MeetProvidersP].
  MeetProvidersPProvider call({
    required DateTimeRange<DateTime> range,
  }) {
    return MeetProvidersPProvider(
      range: range,
    );
  }

  @override
  MeetProvidersPProvider getProviderOverride(
    covariant MeetProvidersPProvider provider,
  ) {
    return call(
      range: provider.range,
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
  String? get name => r'meetProvidersPProvider';
}

/// See also [MeetProvidersP].
class MeetProvidersPProvider extends AutoDisposeStreamNotifierProviderImpl<
    MeetProvidersP, List<FullMeetView>> {
  /// See also [MeetProvidersP].
  MeetProvidersPProvider({
    required DateTimeRange<DateTime> range,
  }) : this._internal(
          () => MeetProvidersP()..range = range,
          from: meetProvidersPProvider,
          name: r'meetProvidersPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$meetProvidersPHash,
          dependencies: MeetProvidersPFamily._dependencies,
          allTransitiveDependencies:
              MeetProvidersPFamily._allTransitiveDependencies,
          range: range,
        );

  MeetProvidersPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.range,
  }) : super.internal();

  final DateTimeRange<DateTime> range;

  @override
  Stream<List<FullMeetView>> runNotifierBuild(
    covariant MeetProvidersP notifier,
  ) {
    return notifier.build(
      range: range,
    );
  }

  @override
  Override overrideWith(MeetProvidersP Function() create) {
    return ProviderOverride(
      origin: this,
      override: MeetProvidersPProvider._internal(
        () => create()..range = range,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        range: range,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<MeetProvidersP, List<FullMeetView>>
      createElement() {
    return _MeetProvidersPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MeetProvidersPProvider && other.range == range;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, range.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MeetProvidersPRef
    on AutoDisposeStreamNotifierProviderRef<List<FullMeetView>> {
  /// The parameter `range` of this provider.
  DateTimeRange<DateTime> get range;
}

class _MeetProvidersPProviderElement
    extends AutoDisposeStreamNotifierProviderElement<MeetProvidersP,
        List<FullMeetView>> with MeetProvidersPRef {
  _MeetProvidersPProviderElement(super.provider);

  @override
  DateTimeRange<DateTime> get range => (origin as MeetProvidersPProvider).range;
}

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
