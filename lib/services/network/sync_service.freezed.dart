// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SyncState {
  ConnectivityResult get connectivityResult =>
      throw _privateConstructorUsedError;
  int get toSync => throw _privateConstructorUsedError;
  bool get isUploading => throw _privateConstructorUsedError;
  bool get isDownloading => throw _privateConstructorUsedError;
  DateTime get lastSyncedAt => throw _privateConstructorUsedError;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncStateCopyWith<SyncState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncStateCopyWith<$Res> {
  factory $SyncStateCopyWith(SyncState value, $Res Function(SyncState) then) =
      _$SyncStateCopyWithImpl<$Res, SyncState>;
  @useResult
  $Res call(
      {ConnectivityResult connectivityResult,
      int toSync,
      bool isUploading,
      bool isDownloading,
      DateTime lastSyncedAt});
}

/// @nodoc
class _$SyncStateCopyWithImpl<$Res, $Val extends SyncState>
    implements $SyncStateCopyWith<$Res> {
  _$SyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectivityResult = null,
    Object? toSync = null,
    Object? isUploading = null,
    Object? isDownloading = null,
    Object? lastSyncedAt = null,
  }) {
    return _then(_value.copyWith(
      connectivityResult: null == connectivityResult
          ? _value.connectivityResult
          : connectivityResult // ignore: cast_nullable_to_non_nullable
              as ConnectivityResult,
      toSync: null == toSync
          ? _value.toSync
          : toSync // ignore: cast_nullable_to_non_nullable
              as int,
      isUploading: null == isUploading
          ? _value.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSyncedAt: null == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SyncStateImplCopyWith<$Res>
    implements $SyncStateCopyWith<$Res> {
  factory _$$SyncStateImplCopyWith(
          _$SyncStateImpl value, $Res Function(_$SyncStateImpl) then) =
      __$$SyncStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ConnectivityResult connectivityResult,
      int toSync,
      bool isUploading,
      bool isDownloading,
      DateTime lastSyncedAt});
}

/// @nodoc
class __$$SyncStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncStateImpl>
    implements _$$SyncStateImplCopyWith<$Res> {
  __$$SyncStateImplCopyWithImpl(
      _$SyncStateImpl _value, $Res Function(_$SyncStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connectivityResult = null,
    Object? toSync = null,
    Object? isUploading = null,
    Object? isDownloading = null,
    Object? lastSyncedAt = null,
  }) {
    return _then(_$SyncStateImpl(
      connectivityResult: null == connectivityResult
          ? _value.connectivityResult
          : connectivityResult // ignore: cast_nullable_to_non_nullable
              as ConnectivityResult,
      toSync: null == toSync
          ? _value.toSync
          : toSync // ignore: cast_nullable_to_non_nullable
              as int,
      isUploading: null == isUploading
          ? _value.isUploading
          : isUploading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSyncedAt: null == lastSyncedAt
          ? _value.lastSyncedAt
          : lastSyncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SyncStateImpl implements _SyncState {
  const _$SyncStateImpl(
      {required this.connectivityResult,
      required this.toSync,
      required this.isUploading,
      required this.isDownloading,
      required this.lastSyncedAt});

  @override
  final ConnectivityResult connectivityResult;
  @override
  final int toSync;
  @override
  final bool isUploading;
  @override
  final bool isDownloading;
  @override
  final DateTime lastSyncedAt;

  @override
  String toString() {
    return 'SyncState(connectivityResult: $connectivityResult, toSync: $toSync, isUploading: $isUploading, isDownloading: $isDownloading, lastSyncedAt: $lastSyncedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncStateImpl &&
            (identical(other.connectivityResult, connectivityResult) ||
                other.connectivityResult == connectivityResult) &&
            (identical(other.toSync, toSync) || other.toSync == toSync) &&
            (identical(other.isUploading, isUploading) ||
                other.isUploading == isUploading) &&
            (identical(other.isDownloading, isDownloading) ||
                other.isDownloading == isDownloading) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, connectivityResult, toSync,
      isUploading, isDownloading, lastSyncedAt);

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncStateImplCopyWith<_$SyncStateImpl> get copyWith =>
      __$$SyncStateImplCopyWithImpl<_$SyncStateImpl>(this, _$identity);
}

abstract class _SyncState implements SyncState {
  const factory _SyncState(
      {required final ConnectivityResult connectivityResult,
      required final int toSync,
      required final bool isUploading,
      required final bool isDownloading,
      required final DateTime lastSyncedAt}) = _$SyncStateImpl;

  @override
  ConnectivityResult get connectivityResult;
  @override
  int get toSync;
  @override
  bool get isUploading;
  @override
  bool get isDownloading;
  @override
  DateTime get lastSyncedAt;

  /// Create a copy of SyncState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncStateImplCopyWith<_$SyncStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
