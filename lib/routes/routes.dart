import 'package:games_organizing/config/dependency_injection.dart';
import 'package:games_organizing/features/auth/presentaion/view/login_view.dart';
import 'package:games_organizing/features/forgotPassword/presentaion/view/forgot_password_view.dart';
import 'package:games_organizing/features/home/presentation/view/home_view.dart';
import 'package:games_organizing/features/main/presentation/view/main_view.dart';
import 'package:games_organizing/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import '../core/resources/manager_strings.dart';
import '../features/auth/presentaion/view/register_view.dart';
import '../features/choose_account/presentation/view/choose_Account.dart';
import '../features/email_code_verification/presentation/view/verification_view.dart';
import '../features/out_bording/presentation/view/out_boarding_view.dart';
import '../features/reset_password/presentasion/view/reset_password.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String outBoardingView = '/out_boarding_view';
  static const String loginView = '/login_view';
  static const String registerView = '/register_view';
  static const String chooseAccountView = '/choose_account';
  static const String forgotPasswordView = '/forgot_password_view';
  static const String verificatinView = '/verification_view.dart';
  static const String resetPasswordView = '/reset_password.dart';
  static const String mainView = '/main_view.dart';
  static const String homeView = '/home_view.dart';
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
        initChooseAccountsView();
        return MaterialPageRoute(builder: (_) => const ChooseAccountView());
      case Routes.loginView:
        initLoginView();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.mainView:
        initMainModule();
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.homeView:
        // initMainModule();
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.registerView:
        initRegisterView();
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgotPasswordView:
        initForgotPasswordView();
        return MaterialPageRoute(builder: (_) => ForgotPassword());
      case Routes.verificatinView:
        initVerificationView();
        return MaterialPageRoute(builder: (_) => VerificationView());
      case Routes.resetPasswordView:
        initResetPassView();
        return MaterialPageRoute(builder: (_) => ResetPasswordView());
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
