import 'package:flutter/material.dart';
import 'package:games_organizing/features/out_bording/presentation/controller/out_boarding_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
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

initLoginView() {
  disposeOutBoarding();
  // Get.put<OutBoarddingController>(OutBoarddingController());
}
