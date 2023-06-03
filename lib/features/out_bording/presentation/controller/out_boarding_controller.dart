import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/manager_assets.dart';
import 'package:games_organizing/core/resources/manager_strings.dart';
import 'package:get/get.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import '../../../../config/constants.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/widgets/welcome_page_view.dart';
import '../../../../routes/routes.dart';

class OutBoarddingController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  final int pageCount = 3;
  double width = MediaQuery.of(Get.context!).size.width;
  double height = MediaQuery.of(Get.context!).size.height;
  final List<Widget> pagesContent = [
    welcomePageView(
      title: ManagerStrings.outBoardingfirstTitle,
      description: ManagerStrings.outBoardingfirstBody,
      photoAsset: ManagerAssets.illustration1,
    ),
    welcomePageView(
      title: ManagerStrings.outBoardingSecondTitle,
      description: ManagerStrings.outBoardingSecondBody,
      photoAsset: ManagerAssets.illustration2,
    ),
    welcomePageView(
      title: ManagerStrings.outBoardingThirdTitle,
      description: ManagerStrings.outBoardingThirdBody,
      photoAsset: ManagerAssets.illustration3,
    ),
  ];
  void _customAnimateToPage(int page) {
    pageController.animateToPage(
      page.onNull(),
      duration: const Duration(seconds: Constants.outBoardingDurationTime),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    update();
  }

  void setCurrentPageIndex(int pageIndex) {
    currentPageIndex = pageIndex;
    update();
  }

  void skipPage() {
    isNotLastPage() ? _customAnimateToPage(pageCount - 1) : null;
    currentPageIndex = pageCount - 1;
    update();
  }

  bool isNotLastPage() {
    return currentPageIndex != pageCount - 1;
  }

  void gotoNextPage() {
    isNotLastPage()
        ? _customAnimateToPage(++currentPageIndex)
        : Get.offAllNamed(Routes.loginView);
    update();
  }

  String buttonText() {
    return isNotLastPage() ? ManagerStrings.next : ManagerStrings.startNow;
  }

  BoxShape indicatorShape(int index) {
    return index == currentPageIndex ? BoxShape.rectangle : BoxShape.circle;
  }

  BorderRadius? indicatorBorderRadius(int index) {
    return index == currentPageIndex ? BorderRadius.circular(10) : null;
  }

  Color? indicatorColor(int index) {
    return index == currentPageIndex
        ? ManagerColors.activeColorIndicator
        : ManagerColors.inactiveColorIndicator;
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
