import 'package:dio/dio.dart';
import 'package:weather_app/domain/model/forecast/forecast.dart';
import 'package:weather_app/domain/model/weather/weather.dart';
import 'package:weather_app/get_it.dart';
import 'package:weather_app/utils/api/url_map_api.dart';
import 'package:weather_app/utils/api_key.dart';
import 'package:weather_app/utils/common/common.dart';

class WeatherApiService {
  final _dio = locate<Dio>();

  Future<Weather> getWeatherByLocation(
      {required double lat, required double lon}) async {
    try {
      final response = await _dio
          .get(URlMapAPI(ApiKey.token).weatherByLocation(lat, lon).toString());
      final data = Weather.fromJson(response.data);
      return data;
    } catch (e, stack) {
      weatherPrint(stack);
      rethrow;
    }
  }

  Future<Forecast> getForecastByLocation(
      {required double lat, required double lon}) async {
    try {
      final response = await _dio
          .get(URlMapAPI(ApiKey.token).forecastByLocation(lat, lon).toString());
      final data = Forecast.fromJson(response.data);
      return data;
    } catch (e, stack) {
      weatherPrint(stack);
      rethrow;
    }
  }

  Future<Weather> getWeatherByCity({required String city}) async {
    try {
      final response =
          await _dio.get(URlMapAPI(ApiKey.token).weather(city).toString());
      final data = Weather.fromJson(response.data);
      return data;
    } catch (e, stack) {
      weatherPrint(stack);
      rethrow;
    }
  }

  Future<Forecast> getForecastByCity({required String city}) async {
    try {
      final response =
          await _dio.get(URlMapAPI(ApiKey.token).forecast(city).toString());
      final data = Forecast.fromJson(response.data);
      return data;
    } catch (e, stack) {
      weatherPrint(stack);
      rethrow;
    }
  }
}
