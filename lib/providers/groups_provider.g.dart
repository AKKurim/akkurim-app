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
String _$groupsPHash() => r'6e54b3f086c1852f13a7d8678dbb68813f409d25';

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
