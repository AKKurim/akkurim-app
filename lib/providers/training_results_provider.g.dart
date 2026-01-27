// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_results_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trainingResultsPHash() => r'77520992ec43d298b6515b31af716c20c3dcda4a';

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

abstract class _$TrainingResultsP
    extends BuildlessAutoDisposeStreamNotifier<List<FullMeetView>> {
  late final FullMeetView? preloadedMeet;

  Stream<List<FullMeetView>> build({
    FullMeetView? preloadedMeet,
  });
}

/// See also [TrainingResultsP].
@ProviderFor(TrainingResultsP)
const trainingResultsPProvider = TrainingResultsPFamily();

/// See also [TrainingResultsP].
class TrainingResultsPFamily extends Family<AsyncValue<List<FullMeetView>>> {
  /// See also [TrainingResultsP].
  const TrainingResultsPFamily();

  /// See also [TrainingResultsP].
  TrainingResultsPProvider call({
    FullMeetView? preloadedMeet,
  }) {
    return TrainingResultsPProvider(
      preloadedMeet: preloadedMeet,
    );
  }

  @override
  TrainingResultsPProvider getProviderOverride(
    covariant TrainingResultsPProvider provider,
  ) {
    return call(
      preloadedMeet: provider.preloadedMeet,
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
  String? get name => r'trainingResultsPProvider';
}

/// See also [TrainingResultsP].
class TrainingResultsPProvider extends AutoDisposeStreamNotifierProviderImpl<
    TrainingResultsP, List<FullMeetView>> {
  /// See also [TrainingResultsP].
  TrainingResultsPProvider({
    FullMeetView? preloadedMeet,
  }) : this._internal(
          () => TrainingResultsP()..preloadedMeet = preloadedMeet,
          from: trainingResultsPProvider,
          name: r'trainingResultsPProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trainingResultsPHash,
          dependencies: TrainingResultsPFamily._dependencies,
          allTransitiveDependencies:
              TrainingResultsPFamily._allTransitiveDependencies,
          preloadedMeet: preloadedMeet,
        );

  TrainingResultsPProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.preloadedMeet,
  }) : super.internal();

  final FullMeetView? preloadedMeet;

  @override
  Stream<List<FullMeetView>> runNotifierBuild(
    covariant TrainingResultsP notifier,
  ) {
    return notifier.build(
      preloadedMeet: preloadedMeet,
    );
  }

  @override
  Override overrideWith(TrainingResultsP Function() create) {
    return ProviderOverride(
      origin: this,
      override: TrainingResultsPProvider._internal(
        () => create()..preloadedMeet = preloadedMeet,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        preloadedMeet: preloadedMeet,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<TrainingResultsP, List<FullMeetView>>
      createElement() {
    return _TrainingResultsPProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrainingResultsPProvider &&
        other.preloadedMeet == preloadedMeet;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, preloadedMeet.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TrainingResultsPRef
    on AutoDisposeStreamNotifierProviderRef<List<FullMeetView>> {
  /// The parameter `preloadedMeet` of this provider.
  FullMeetView? get preloadedMeet;
}

class _TrainingResultsPProviderElement
    extends AutoDisposeStreamNotifierProviderElement<TrainingResultsP,
        List<FullMeetView>> with TrainingResultsPRef {
  _TrainingResultsPProviderElement(super.provider);

  @override
  FullMeetView? get preloadedMeet =>
      (origin as TrainingResultsPProvider).preloadedMeet;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
