// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentTrainerHash() => r'f0cf1f9e61e7de1df2c1393b28cd622103567c63';

/// See also [currentTrainer].
@ProviderFor(currentTrainer)
final currentTrainerProvider = AutoDisposeStreamProvider<TrainerView>.internal(
  currentTrainer,
  name: r'currentTrainerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentTrainerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentTrainerRef = AutoDisposeStreamProviderRef<TrainerView>;
String _$trainerPHash() => r'e401db577873ad1f02a9cec6c09ae2fc1d038474';

/// See also [TrainerP].
@ProviderFor(TrainerP)
final trainerPProvider =
    AutoDisposeStreamNotifierProvider<TrainerP, List<TrainerView>>.internal(
  TrainerP.new,
  name: r'trainerPProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$trainerPHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TrainerP = AutoDisposeStreamNotifier<List<TrainerView>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
