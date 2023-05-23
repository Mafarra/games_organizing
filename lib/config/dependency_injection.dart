import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../features/splash/presentation/controller/splash_controller.dart';

final instance = GetIt.instance;
initSplash() {
  Get.put<SplashController>(
    SplashController(),
  );
}

finishSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  finishSplash();
}