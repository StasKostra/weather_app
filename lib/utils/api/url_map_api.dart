import 'package:weather_app/utils/constant/constant.dart';

class URlMapAPI {
  URlMapAPI(this.apiKey);
  final String apiKey;

  Uri weather(String city) => _buildUri(
        endpoint: "weather",
        parametersBuilder: () => cityQueryParameters(city),
      );

  Uri weatherByLocation(double lat, double lon) => _buildUri(
        endpoint: "weather",
        parametersBuilder: () => locationQueryParameters(lat, lon),
      );

  Uri forecast(String city) => _buildUri(
        endpoint: "forecast",
        parametersBuilder: () => cityQueryParameters(city),
      );

  Uri forecastByLocation(double lat, double lon) => _buildUri(
        endpoint: "forecast",
        parametersBuilder: () => locationQueryParameters(lat, lon),
      );

  Uri _buildUri({
    required String endpoint,
    required Map<String, dynamic> Function() parametersBuilder,
  }) {
    return Uri(
      scheme: "https",
      host: apiBaseUrl,
      path: "$apiPath$endpoint",
      queryParameters: parametersBuilder(),
    );
  }

  Map<String, dynamic> cityQueryParameters(String city) => {
        "q": city,
        "cnt": "40",
        "appid": apiKey,
        "units": "metric",
      };

  Map<String, dynamic> locationQueryParameters(double lat, double lon) => {
        "lat": lat.toString(),
        "lon": lon.toString(),
        "cnt": "40",
        "appid": apiKey,
        "units": "metric",
      };

  static String icon(String icon, int size) =>
      'https://openweathermap.org/img/wn/$icon@${size}x.png';
}
