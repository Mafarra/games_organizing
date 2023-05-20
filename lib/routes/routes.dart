import 'package:games_organizing/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

import '../core/resources/manager_strings.dart';

class Routes {
  static const String splashView = '/splash_view';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(ManagerStrings.noRouteFound),
              ),
              body: const Center(child: Text(ManagerStrings.noRouteFound)),
            ));
  }
}
