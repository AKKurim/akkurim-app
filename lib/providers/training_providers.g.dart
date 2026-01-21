// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$schoolYearsHash() => r'f0e1b0ab3a90d307d165aa87862af7b45979c65f';

/// See also [schoolYears].
@ProviderFor(schoolYears)
final schoolYearsProvider =
    AutoDisposeStreamProvider<List<SchoolYearData>>.internal(
  schoolYears,
  name: r'schoolYearsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$schoolYearsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SchoolYearsRef = AutoDisposeStreamProviderRef<List<SchoolYearData>>;
String _$trainingTimesHash() => r'27c3f813d831227d12bbf80da3e2be58b8f7e666';

/// See also [trainingTimes].
@ProviderFor(trainingTimes)
final trainingTimesProvider =
    AutoDisposeStreamProvider<List<TrainingTimeData>>.internal(
  trainingTimes,
  name: r'trainingTimesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trainingTimesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TrainingTimesRef = AutoDisposeStreamProviderRef<List<TrainingTimeData>>;
String _$trainingsPHash() => r'3fd9d3d287268f6803772b8ecf0e5e13244e1d4b';

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

abstract class _$TrainingsP
    extends BuildlessAutoDisposeStreamNotifier<List<TrainingView>> {
  late final DateTimeRange<DateTime> range;

  Stream<List<TrainingView>> build({
    required DateTimeRange<DateTime> range,
  });
}

/// See also [TrainingsP].
@ProviderFor(TrainingsP)
const trainingsPProvider = TrainingsPFamily();

/// See also [TrainingsP].
class TrainingsPFamily extends Family<AsyncValue<List<TrainingView>>> {
  /// See also [TrainingsP].
  const TrainingsPFamily();

  /// See also [TrainingsP].
  TrainingsPProvider call({
    required DateTimeRange<DateTime> range,
  }) {
    return TrainingsPProvider(
      range: range,
    );
  }

  @override
  TrainingsPProvider getProviderOverride(
    covariant TrainingsPProvider provider,
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
  String? get name => r'trainingsPProvider';
}

/// See also [TrainingsP].
class TrainingsPProvider extends AutoDisposeStreamNotifierProviderImpl<
    TrainingsP, List<TrainingView>> {
  /// See also [TrainingsP].
  TrainingsPProvider({
    required DateTimeRange<DateTime> range,
  }) : this._internal(
          () => TrainingsP()..range = range,
          from: trainingsPProvider,
          name: r'trainingsPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trainingsPHash,
          dependencies: TrainingsPFamily._dependencies,
          allTransitiveDependencies:
              TrainingsPFamily._allTransitiveDependencies,
          range: range,
        );

  TrainingsPProvider._internal(
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
  Stream<List<TrainingView>> runNotifierBuild(
    covariant TrainingsP notifier,
  ) {
    return notifier.build(
      range: range,
    );
  }

  @override
  Override overrideWith(TrainingsP Function() create) {
    return ProviderOverride(
      origin: this,
      override: TrainingsPProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<TrainingsP, List<TrainingView>>
      createElement() {
    return _TrainingsPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrainingsPProvider && other.range == range;
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
mixin TrainingsPRef
    on AutoDisposeStreamNotifierProviderRef<List<TrainingView>> {
  /// The parameter `range` of this provider.
  DateTimeRange<DateTime> get range;
}

class _TrainingsPProviderElement
    extends AutoDisposeStreamNotifierProviderElement<TrainingsP,
        List<TrainingView>> with TrainingsPRef {
  _TrainingsPProviderElement(super.provider);

  @override
  DateTimeRange<DateTime> get range => (origin as TrainingsPProvider).range;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
