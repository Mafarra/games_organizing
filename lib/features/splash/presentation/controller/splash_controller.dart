import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games_organizing/core/resources/manager_color.dart';
import 'package:games_organizing/core/resources/manager_styles.dart';
import 'package:games_organizing/core/util/size_util.dart';
import 'package:get/get.dart';
import '../../../../config/constants.dart';
import '../../../../core/widgets/dashed_indicator.dart';
import '../../../../core/widgets/welcome_page_view.dart';
import '../../../out_bording/presentation/view/out_boarding_view.dart';

class SplashController extends GetxController {
  final PageController _pageController = PageController(initialPage: 0);
  final RxInt _currentPageIndex = 0.obs;
  final int _pageCount = 3;

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
      _navigateToNextScreen();
    });
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return SizedBox(
          height: 305.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SizedBox(
                  height: 150.w,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int index) {
                      _currentPageIndex.value = index;
                      update();
                    },
                    children: [
                      welcomePageView(
                        title: "title1",
                        description: "description1",
                      ),
                      welcomePageView(
                        title: "title2",
                        description: "description2",
                      ),
                      welcomePageView(
                        title: "title3",
                        description: "description3",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.w,
              ),
              Obx(
                () => dashedIndicator(
                  currentPageIndex: _currentPageIndex.value,
                  pageCount: _pageCount,
                ),
              ),
              SizedBox(
                height: 20.w,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: SizeUtil.setWidth(16)),
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPageIndex.value < _pageCount - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      update();
                    } else {
                      Get.to(const OutBordingView());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(double.infinity, SizeUtil.setHeight(48.h)),
                    // foregroundColor: ManagerColors.buttonColorLight,
                    backgroundColor: ManagerColors.buttonColorLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Obx(() => Text(
                        _currentPageIndex.value == _pageCount - 1
                            ? 'Start Now'
                            : 'Next',
                            style: getMediumTextStyle(fontSize: 14, color: ManagerColors.textColorblackButton),
                      )),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(const OutBordingView());
                },
                child: const Text('Skip'),
              ),
            ],
          ),
        );
      },
    );
  }
}
