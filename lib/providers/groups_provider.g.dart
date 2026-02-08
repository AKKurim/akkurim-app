// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allGroupDataHash() => r'c121809b21a231ea3a1c6009a82d9c47b8f31340';

/// See also [allGroupData].
@ProviderFor(allGroupData)
final allGroupDataProvider =
    AutoDisposeStreamProvider<List<GroupData>>.internal(
  allGroupData,
  name: r'allGroupDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allGroupDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AllGroupDataRef = AutoDisposeStreamProviderRef<List<GroupData>>;
String _$groupHash() => r'd615a17b68407cba60fa29a3667e3aac96d3738f';

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

/// See also [group].
@ProviderFor(group)
const groupProvider = GroupFamily();

/// See also [group].
class GroupFamily extends Family<AsyncValue<GroupView>> {
  /// See also [group].
  const GroupFamily();

  /// See also [group].
  GroupProvider call(
    String groupId,
  ) {
    return GroupProvider(
      groupId,
    );
  }

  @override
  GroupProvider getProviderOverride(
    covariant GroupProvider provider,
  ) {
    return call(
      provider.groupId,
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
  String? get name => r'groupProvider';
}

/// See also [group].
class GroupProvider extends AutoDisposeStreamProvider<GroupView> {
  /// See also [group].
  GroupProvider(
    String groupId,
  ) : this._internal(
          (ref) => group(
            ref as GroupRef,
            groupId,
          ),
          from: groupProvider,
          name: r'groupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupHash,
          dependencies: GroupFamily._dependencies,
          allTransitiveDependencies: GroupFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  GroupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  Override overrideWith(
    Stream<GroupView> Function(GroupRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupProvider._internal(
        (ref) => create(ref as GroupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<GroupView> createElement() {
    return _GroupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupRef on AutoDisposeStreamProviderRef<GroupView> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupProviderElement extends AutoDisposeStreamProviderElement<GroupView>
    with GroupRef {
  _GroupProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupProvider).groupId;
}

String _$groupsPHash() => r'6ccdd317012c70ae5456b1aa81b07b3c1c19a5a2';

/// See also [GroupsP].
@ProviderFor(GroupsP)
final groupsPProvider =
    AutoDisposeStreamNotifierProvider<GroupsP, List<GroupView>>.internal(
  GroupsP.new,
  name: r'groupsPProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$groupsPHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GroupsP = AutoDisposeStreamNotifier<List<GroupView>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
