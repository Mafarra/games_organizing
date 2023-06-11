import 'package:flutter/material.dart';
import 'package:games_organizing/features/auth/presentaion/controller/login_controller.dart';
import 'package:games_organizing/features/out_bording/presentation/controller/out_boarding_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../features/auth/presentaion/controller/registration_controller.dart';
import '../features/choose_account/presentation/controller/choose_account_controller.dart';
import '../features/forgotPssword/presentaion/controller/forgot_password_controller.dart';
import '../features/splash/presentation/controller/splash_controller.dart';

final instance = GetIt.instance;

initModul() async {
  WidgetsFlutterBinding.ensureInitialized();
}

initSplash() {
  Get.put<SplashController>(
    SplashController(),
  );
}

disposeSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  disposeSplash();
  Get.put<OutBoarddingController>(OutBoarddingController());
}

disposeOutBoarding() {
  Get.delete<OutBoarddingController>();
}

initChooseAccountsView() {
  disposeOutBoarding();
  Get.put<ChooseAccountController>(
    ChooseAccountController(),
  );
}

disposeChooseAccountsView() {
  Get.delete<ChooseAccountController>();
}

initLoginView() {
    disposeRegisterView();
    disposeOutBoarding();
    disposeChooseAccountsView();
  Get.put<LoginController>(LoginController());
}

disposeLoginView() {
  Get.delete<LoginController>();
}

initRegisterView() {
  disposeLoginView();
  Get.put<RegisterController>(RegisterController());
}
initForgotPasswordView() {
  Get.put<ForgotPasswordConteroller>(ForgotPasswordConteroller());
}

disposeRegisterView() {
  Get.delete<RegisterController>();
}
