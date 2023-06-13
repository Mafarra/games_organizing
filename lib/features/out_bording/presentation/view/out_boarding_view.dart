import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import 'package:games_organizing/core/resources/managers_size.dart';
import 'package:games_organizing/features/out_bording/presentation/controller/out_boarding_controller.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/util/size_util.dart';
import '../../../../core/widgets/dashed_indicator.dart';
import '../../../../core/widgets/main_button.dart';

class OutBordingView extends StatelessWidget {
  const OutBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ManagerColors.primaryColor,
          toolbarHeight: 0,
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: ManagerColors.background,
        body: SafeArea(
          child: GetBuilder<OutBoarddingController>(
              init: OutBoarddingController(),
              builder: (controller) {
                return Column(
                  children: [
                    Expanded(
                      child: Directionality(
                        //this direction will be belong to the language
                        textDirection: TextDirection.rtl,
                        child: PageView(
                          dragStartBehavior: DragStartBehavior.start,
                          controller: controller.pageController,
                          onPageChanged: (index) =>
                              controller.setCurrentPageIndex(index),
                          children: [
                            ...controller.pagesContent,
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    dashedIndicator(
                      currentPageIndex: controller.currentPageIndex,
                      pageCount: controller.pageCount,
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeUtil.setWidth(16)),
                      child: mainButton(
                        onPressed: () => controller.gotoNextPage(),
                        color: ManagerColors.buttonColorLight,
                        height: ManagerHeight.h48,
                        minWidth: double.infinity,
                        shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          controller.buttonText().onNull(),
                          style: getMediumTextStyle(
                              fontSize: 14,
                              color: ManagerColors.textColorblackButton),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: controller.isNotLastPage(),
                      maintainSize: true,
                      maintainState: true,
                      maintainAnimation: true,
                      child: mainButton(
                        onPressed: () => controller.skipPage(),
                        child: Text(
                          ManagerStrings.skip,
                          style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: ManagerColors.grey),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ));
  }
}
