import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/get_it.dart';
import 'package:weather_app/presentation/bloc/effects/cubit_with_effect.dart';
import 'package:weather_app/presentation/bloc/effects/ui_effect.dart';
import 'package:weather_app/presentation/bloc/weather/weather_state.dart';
import 'package:weather_app/presentation/bloc/weather/wether_effect.dart';

class WeatherCubit extends CubitWithEffects<WeatherState, UiEffect> {
  final weatherRepository = locate<WeatherRepository>();
  WeatherCubit() : super(const WeatherState()) {
    init();
  }

  Future<void> init() async {
    final permissionResult = await weatherRepository.getLocationPermission();
    if (permissionResult.isServiceEnabled) {
      await weatherRepository.getCurrentLocation();
    } else {
      await weatherRepository.getLocationPermission();
    }
    getWeatherByLocation();
    getForecastByLocation();
  }

  Future<void> getWeatherByLocation() async {
    try {
      emit(state.copyWith(isLoading: true));

      final response = await weatherRepository.fetchWeatherByLocation();

      response.when((success) {
        emit(state.copyWith(weather: success));
      }, (error) {
        emit(state.copyWith(isLoading: false));
        emitEffect(ApiExeption(error.toString()));
      });
    } catch (e) {
      emitEffect(ApiExeption(e.toString()));
    }
  }

  Future<void> getForecastByLocation() async {
    try {
      final response = await weatherRepository.fetchForecastByLocation();
      response.when((success) {
        emit(state.copyWith(forecast: success, isLoading: false));
      }, (error) {
        emitEffect(ApiExeption(error.toString()));
      });
    } catch (e) {
      emitEffect(ApiExeption(e.toString()));
    }
  }

  Future<void> getWeatherByCity() async {
    try {
      if (state.inputCity != '') {
        emit(state.copyWith(isLoading: true));
        final response =
            await weatherRepository.fetchWeatherByCity(city: state.inputCity);

        response.when((success) {
          emit(state.copyWith(weather: success, isLoading: false));
        }, (error) {
          emit(state.copyWith(isLoading: false));
          emitEffect(ApiExeption(error.toString()));
        });
      }
    } catch (e) {
      emitEffect(ApiExeption(e.toString()));
    }
  }

  Future<void> getForecastByCity() async {
    try {
      if (state.inputCity != '') {
        final response =
            await weatherRepository.fetchForecastByCity(city: state.inputCity);
        response.when((success) {
          emit(
            state.copyWith(forecast: success, isLoading: false),
          );
        }, (error) {
          emit(state.copyWith(isLoading: false));
          emitEffect(ApiExeption(error.toString()));
        });
      }
    } catch (e) {
      emitEffect(ApiExeption(e.toString()));
    }
  }

  void onChangeInputCity(String city) {
    emit(state.copyWith(inputCity: city));
  }
}
