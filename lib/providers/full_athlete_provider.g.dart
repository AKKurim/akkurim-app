// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_athlete_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fullAthletePHash() => r'9f3845518f142a589844c54d64b3778c70527620';

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

abstract class _$FullAthleteP
    extends BuildlessAutoDisposeStreamNotifier<FullAthleteView> {
  late final String athleteId;

  Stream<FullAthleteView> build(
    String athleteId,
  );
}

/// See also [FullAthleteP].
@ProviderFor(FullAthleteP)
const fullAthletePProvider = FullAthletePFamily();

/// See also [FullAthleteP].
class FullAthletePFamily extends Family<AsyncValue<FullAthleteView>> {
  /// See also [FullAthleteP].
  const FullAthletePFamily();

  /// See also [FullAthleteP].
  FullAthletePProvider call(
    String athleteId,
  ) {
    return FullAthletePProvider(
      athleteId,
    );
  }

  @override
  FullAthletePProvider getProviderOverride(
    covariant FullAthletePProvider provider,
  ) {
    return call(
      provider.athleteId,
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
  String? get name => r'fullAthletePProvider';
}

/// See also [FullAthleteP].
class FullAthletePProvider extends AutoDisposeStreamNotifierProviderImpl<
    FullAthleteP, FullAthleteView> {
  /// See also [FullAthleteP].
  FullAthletePProvider(
    String athleteId,
  ) : this._internal(
          () => FullAthleteP()..athleteId = athleteId,
          from: fullAthletePProvider,
          name: r'fullAthletePProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fullAthletePHash,
          dependencies: FullAthletePFamily._dependencies,
          allTransitiveDependencies:
              FullAthletePFamily._allTransitiveDependencies,
          athleteId: athleteId,
        );

  FullAthletePProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.athleteId,
  }) : super.internal();

  final String athleteId;

  @override
  Stream<FullAthleteView> runNotifierBuild(
    covariant FullAthleteP notifier,
  ) {
    return notifier.build(
      athleteId,
    );
  }

  @override
  Override overrideWith(FullAthleteP Function() create) {
    return ProviderOverride(
      origin: this,
      override: FullAthletePProvider._internal(
        () => create()..athleteId = athleteId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        athleteId: athleteId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<FullAthleteP, FullAthleteView>
      createElement() {
    return _FullAthletePProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FullAthletePProvider && other.athleteId == athleteId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, athleteId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FullAthletePRef on AutoDisposeStreamNotifierProviderRef<FullAthleteView> {
  /// The parameter `athleteId` of this provider.
  String get athleteId;
}

class _FullAthletePProviderElement
    extends AutoDisposeStreamNotifierProviderElement<FullAthleteP,
        FullAthleteView> with FullAthletePRef {
  _FullAthletePProviderElement(super.provider);

  @override
  String get athleteId => (origin as FullAthletePProvider).athleteId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
