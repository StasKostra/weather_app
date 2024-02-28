import 'package:weather_app/presentation/bloc/effects/ui_effect.dart';

class ApiExeption implements UiEffect {
  String failureText;
  ApiExeption(this.failureText);
}
