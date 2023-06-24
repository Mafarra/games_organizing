import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/constants.dart';
import '../../../../core/util/sh_util.dart';
import '../../../../routes/routes.dart';

class SplashController extends GetxController {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: Constants.splashDuration,
        ), () {
      if (SharedPref.instance.getOutBoardingViewed()) {
        if (SharedPref.instance.getIsUserLogin()) {
          Get.offAllNamed(Routes.mainView);
        } else {
          Get.offAllNamed(Routes.loginView);
        }
      } else {
        Get.offAllNamed(
          Routes.outBoardingView,
        );
      }
    });
  }
}
