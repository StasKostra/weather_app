// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_permission_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationPermissionResult {
  bool get isServiceEnabled => throw _privateConstructorUsedError;
  LocationPermission get permission => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationPermissionResultCopyWith<LocationPermissionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationPermissionResultCopyWith<$Res> {
  factory $LocationPermissionResultCopyWith(LocationPermissionResult value,
          $Res Function(LocationPermissionResult) then) =
      _$LocationPermissionResultCopyWithImpl<$Res, LocationPermissionResult>;
  @useResult
  $Res call({bool isServiceEnabled, LocationPermission permission});
}

/// @nodoc
class _$LocationPermissionResultCopyWithImpl<$Res,
        $Val extends LocationPermissionResult>
    implements $LocationPermissionResultCopyWith<$Res> {
  _$LocationPermissionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isServiceEnabled = null,
    Object? permission = null,
  }) {
    return _then(_value.copyWith(
      isServiceEnabled: null == isServiceEnabled
          ? _value.isServiceEnabled
          : isServiceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as LocationPermission,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationPermissionResultImplCopyWith<$Res>
    implements $LocationPermissionResultCopyWith<$Res> {
  factory _$$LocationPermissionResultImplCopyWith(
          _$LocationPermissionResultImpl value,
          $Res Function(_$LocationPermissionResultImpl) then) =
      __$$LocationPermissionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isServiceEnabled, LocationPermission permission});
}

/// @nodoc
class __$$LocationPermissionResultImplCopyWithImpl<$Res>
    extends _$LocationPermissionResultCopyWithImpl<$Res,
        _$LocationPermissionResultImpl>
    implements _$$LocationPermissionResultImplCopyWith<$Res> {
  __$$LocationPermissionResultImplCopyWithImpl(
      _$LocationPermissionResultImpl _value,
      $Res Function(_$LocationPermissionResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isServiceEnabled = null,
    Object? permission = null,
  }) {
    return _then(_$LocationPermissionResultImpl(
      isServiceEnabled: null == isServiceEnabled
          ? _value.isServiceEnabled
          : isServiceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      permission: null == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as LocationPermission,
    ));
  }
}

/// @nodoc

class _$LocationPermissionResultImpl implements _LocationPermissionResult {
  _$LocationPermissionResultImpl(
      {required this.isServiceEnabled, required this.permission});

  @override
  final bool isServiceEnabled;
  @override
  final LocationPermission permission;

  @override
  String toString() {
    return 'LocationPermissionResult(isServiceEnabled: $isServiceEnabled, permission: $permission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationPermissionResultImpl &&
            (identical(other.isServiceEnabled, isServiceEnabled) ||
                other.isServiceEnabled == isServiceEnabled) &&
            (identical(other.permission, permission) ||
                other.permission == permission));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isServiceEnabled, permission);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationPermissionResultImplCopyWith<_$LocationPermissionResultImpl>
      get copyWith => __$$LocationPermissionResultImplCopyWithImpl<
          _$LocationPermissionResultImpl>(this, _$identity);
}

abstract class _LocationPermissionResult implements LocationPermissionResult {
  factory _LocationPermissionResult(
          {required final bool isServiceEnabled,
          required final LocationPermission permission}) =
      _$LocationPermissionResultImpl;

  @override
  bool get isServiceEnabled;
  @override
  LocationPermission get permission;
  @override
  @JsonKey(ignore: true)
  _$$LocationPermissionResultImplCopyWith<_$LocationPermissionResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}
