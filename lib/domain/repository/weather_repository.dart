import 'package:geolocator/geolocator.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:weather_app/data/weather_api_service.dart';
import 'package:weather_app/domain/model/forecast/forecast.dart';
import 'package:weather_app/domain/model/location_permission_result/location_permission_result.dart';
import 'package:weather_app/domain/model/weather/weather.dart';
import 'package:weather_app/get_it.dart';

class WeatherRepository {
  final weatherApiService = locate<WeatherApiService>();
  late Position position;

  Future<void> getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<LocationPermissionResult> getLocationPermission() async {
    bool isServiceEnabled = false;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return LocationPermissionResult(
        isServiceEnabled: false,
        permission: LocationPermission.denied,
      );
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return LocationPermissionResult(
          isServiceEnabled: false,
          permission: LocationPermission.denied,
        );
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return LocationPermissionResult(
        isServiceEnabled: false,
        permission: LocationPermission.deniedForever,
      );
    }

    return LocationPermissionResult(
      isServiceEnabled: true,
      permission: LocationPermission.whileInUse,
    );
  }

  Future<Result<Weather, Exception>> fetchWeatherByLocation() async {
    try {
      final result = await weatherApiService.getWeatherByLocation(
          lat: position.latitude, lon: position.longitude);

      return Result.success(result);
    } catch (e) {
      return Result.error(Exception('Error fetching weather by location: $e'));
    }
  }

  Future<Result<Forecast, Exception>> fetchForecastByLocation() async {
    try {
      final result = await weatherApiService.getForecastByLocation(
          lat: position.latitude, lon: position.longitude);

      return Result.success(result);
    } catch (e) {
      return Result.error(Exception('Error fetching forecast by location: $e'));
    }
  }

  Future<Result<Weather, Exception>> fetchWeatherByCity(
      {required String city}) async {
    try {
      final result = await weatherApiService.getWeatherByCity(city: city);

      return Result.success(result);
    } catch (e) {
      return Result.error(Exception('Error fetching weather by city: $e'));
    }
  }

  Future<Result<Forecast, Exception>> fetchForecastByCity(
      {required String city}) async {
    try {
      final result = await weatherApiService.getForecastByCity(city: city);

      return Result.success(result);
    } catch (e) {
      return Result.error(Exception('Error fetching forecast by city: $e'));
    }
  }
}
