import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/model/forecast/forecast.dart';
import 'package:weather_app/utils/api/url_map_api.dart';

class ForecastList extends StatelessWidget {
  final Forecast forecast;
  const ForecastList({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: ListView.builder(
        itemCount: forecast.list.length,
        itemBuilder: (context, index) {
          final dateTime = DateTime.fromMillisecondsSinceEpoch(
              forecast.list[index].dt * 1000);

          final dayOfWeek = DateFormat('EEE').format(dateTime);
          final hour = DateFormat('j').format(dateTime);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 110,
                  child: Text('$dayOfWeek $hour',
                      style: theme.textTheme.bodyMedium),
                ),
                Image.network(URlMapAPI.icon(
                    forecast.list[index].weatherInfo.first.icon, 2)),
                Text('${forecast.list[index].weatherParams.tempMin.toInt()}°C',
                    style: theme.textTheme.bodyMedium),
                Text(
                  '${forecast.list[index].weatherParams.humidity.toInt()}%',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
