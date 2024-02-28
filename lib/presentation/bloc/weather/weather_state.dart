import 'package:weather_app/domain/model/forecast/forecast.dart';
import 'package:weather_app/domain/model/weather/weather.dart';
// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    Weather? weather,
    Forecast? forecast,
    @Default(false) bool isLoading,
    @Default('') String inputCity,
  }) = _Initial;
}
