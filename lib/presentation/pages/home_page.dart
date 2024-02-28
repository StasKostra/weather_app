import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/model/forecast/forecast.dart';
import 'package:weather_app/domain/model/weather/weather.dart';
import 'package:weather_app/presentation/bloc/weather/weather_cubit.dart';
import 'package:weather_app/presentation/bloc/weather/weather_state.dart';
import 'package:weather_app/presentation/bloc/weather/wether_effect.dart';
import 'package:weather_app/presentation/widgets/city_textfield.dart';
import 'package:weather_app/presentation/widgets/current_weather.dart';
import 'package:weather_app/presentation/widgets/forecast_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<WeatherCubit>(context);
    cubit.effectStream.listen((effect) {
      if (effect is ApiExeption) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(effect.failureText),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        child:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          final cubit = context.read<WeatherCubit>();
          return Column(
            children: [
              CityTextField(
                onChangeInputCity: cubit.onChangeInputCity,
                getForecastByCity: cubit.getForecastByCity,
                getWeatherByCity: cubit.getWeatherByCity,
              ),
              state.isLoading
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(
                        color: theme.colorScheme.secondary,
                      ),
                    ))
                  : _buildScreen(context, state.weather, state.forecast, theme)
            ],
          );
        }),
      ),
    );
  }
}

_buildScreen(BuildContext context, Weather? weather, Forecast? forecast,
    ThemeData theme) {
  return Expanded(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (weather != null) CurrentWeather(weather: weather),
        if (weather != null) Divider(color: theme.colorScheme.secondary),
        if (forecast != null) ForecastList(forecast: forecast),
      ],
    ),
  );
}
