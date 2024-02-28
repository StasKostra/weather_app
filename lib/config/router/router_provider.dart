import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/config/router/routes_name.dart';
import 'package:weather_app/presentation/pages/home_page.dart';
import 'package:weather_app/presentation/pages/splash_page.dart';

class RouterProvider {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutesName.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: RoutesName.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
    ],
  );
}
