import 'package:flutter/material.dart';

class CityTextField extends StatelessWidget {
  final Function(String) onChangeInputCity;
  final Function() getWeatherByCity;
  final Function() getForecastByCity;
  const CityTextField(
      {super.key,
      required this.onChangeInputCity,
      required this.getForecastByCity,
      required this.getWeatherByCity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        cursorColor: theme.colorScheme.secondary,
        style: theme.textTheme.bodyMedium,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                getWeatherByCity();
                getForecastByCity();
              },
              icon: Icon(
                Icons.search,
                color: theme.colorScheme.secondary,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.secondary,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          fillColor: theme.colorScheme.secondary,
          focusColor: theme.colorScheme.secondary,
          hintText: 'Input City',
          hintStyle: theme.textTheme.bodyMedium,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.secondary,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              borderSide: BorderSide(color: theme.colorScheme.secondary)),
        ),
        onSubmitted: (value) {
            getWeatherByCity();
            getForecastByCity();
        },
        onChanged: (String value) {
          onChangeInputCity(value);
        },
      ),
    );
  }
}
