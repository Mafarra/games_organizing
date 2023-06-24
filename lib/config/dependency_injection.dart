import 'package:flutter/material.dart';
import 'package:games_organizing/features/auth/presentaion/controller/login_controller.dart';
import 'package:games_organizing/features/out_bording/presentation/controller/out_boarding_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../features/auth/presentaion/controller/registration_controller.dart';
import '../features/choose_account/presentation/controller/choose_account_controller.dart';
import '../features/email_code_verification/presentation/controller/verification_controller.dart';
import '../features/forgotPassword/presentaion/controller/forgot_password_controller.dart';
import '../features/main/presentation/controller/main_controller.dart';
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

// initChooseAccountsView() {
//   disposeOutBoarding();
//   Get.put<ChooseAccountController>(
//     ChooseAccountController(),
//   );
// }

// disposeChooseAccountsView() {
//   Get.delete<ChooseAccountController>();
// }

initLoginView() {
  disposeRegisterView();
  disposeOutBoarding();
  // disposeChooseAccountsView();
  Get.put<LoginController>(LoginController());
}

disposeLoginView() {
  Get.delete<LoginController>();
}

initRegisterView() {
  disposeLoginView();
  Get.put<RegisterController>(RegisterController());
}

disposeRegisterView() {
  Get.delete<RegisterController>();
}

initForgotPasswordView() {
  disposeLoginView();
  Get.put<ForgotPasswordConteroller>(ForgotPasswordConteroller());
}

disposeForgotPasswordView() {
  Get.delete<ForgotPasswordConteroller>();
}

initVerificationView() {
  disposeForgotPasswordView();
  Get.put<VereificationController>(VereificationController());
}

disposeVerificationView() {
  Get.delete<VereificationController>();
}

initResetPassView() {
  disposeVerificationView();
  Get.put<VereificationController>(VereificationController());
}

disposeResetPassView() {
  Get.delete<VereificationController>();
}

initMainModule() {
  Get.put<MainController>(MainController());
}
