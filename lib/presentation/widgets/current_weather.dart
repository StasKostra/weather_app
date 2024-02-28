import 'package:flutter/material.dart';
import 'package:weather_app/domain/model/weather/weather.dart';
import 'package:weather_app/utils/api/url_map_api.dart';

class CurrentWeather extends StatelessWidget {
  final Weather weather;
  const CurrentWeather({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            weather.cityName.toString(),
            style: theme.textTheme.titleLarge,
          ),
        ),
        Image.network(
          URlMapAPI.icon(weather.weatherInfo.first.icon, 4),
          width: 100,
        ),
        Text(weather.weatherInfo.first.description,
            style: theme.textTheme.bodyMedium),
        Text('${weather.weatherParams.temp.toInt().toString()}°',
            style: theme.textTheme.titleLarge),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('H:${weather.weatherParams.tempMin.toInt()}°',
                  style: theme.textTheme.bodyMedium),
              Text('L:${weather.weatherParams.tempMax.toInt()}°',
                  style: theme.textTheme.bodyMedium)
            ],
          ),
        ),
        Text('${weather.weatherParams.humidity.toInt()}%',
            style: theme.textTheme.bodyMedium),
      ],
    );
  }
}
