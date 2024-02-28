import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'location_permission_result.freezed.dart';

@freezed
class LocationPermissionResult with _$LocationPermissionResult {
  factory LocationPermissionResult({
    required bool isServiceEnabled,
    required LocationPermission permission,
  }) = _LocationPermissionResult;
}
