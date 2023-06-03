import 'package:games_organizing/config/dependency_injection.dart';
import 'package:games_organizing/features/auth/presentaion/view/login_view.dart';
import 'package:games_organizing/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

import '../core/resources/manager_strings.dart';
import '../features/choose_account/presentation/view/choose_Account.dart';
import '../features/out_bording/presentation/view/out_boarding_view.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String outBoardingView = '/out_boarding_view';
  static const String loginView = '/login_view';
  static const String chooseAccountView = '/choose_account';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.outBoardingView:
        initOutBoarding();
        return MaterialPageRoute(builder: (_) => const OutBordingView());
      case Routes.chooseAccountView:
        return MaterialPageRoute(builder: (_) => const ChooseAccountView());
      case Routes.loginView:
        initLoginView();
        return MaterialPageRoute(builder: (_) => const LoginView());
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
