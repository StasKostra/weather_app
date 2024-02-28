import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/data/weather_api_service.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';

class GetItService {
  static final getIt = GetIt.instance;
  static initializeDependencies() {
    final dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';

    getIt.registerSingleton<Dio>(dio);

    getIt.registerSingleton<WeatherApiService>(WeatherApiService());
    getIt.registerSingleton<WeatherRepository>(WeatherRepository());
  }
}

T locate<T extends Object>() {
  return GetItService.getIt<T>();
}
