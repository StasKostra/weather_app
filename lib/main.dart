import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/router/router_provider.dart';
import 'package:weather_app/config/theme/app_theme.dart';
import 'package:weather_app/get_it.dart';
import 'package:weather_app/presentation/bloc/weather/weather_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetItService.initializeDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherCubit(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          routerConfig: RouterProvider.router,
        ));
  }
}
