import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:games_organizing/features/email_code_verification/presentation/view/widget/code_verification.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/resources/managers_size.dart';
import '../../../../core/widgets/main_button.dart';
import '../controller/verification_controller.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
                padding: EdgeInsets.only(
                  top: ManagerHeight.h71,
                  left: ManagerWidth.w16,
                  right: ManagerWidth.w16,
                ),
                child: SvgPicture.asset(
                  ManagerAssets.authenticationIllustration,
                  fit: BoxFit.contain,
                  width: ManagerWidth.w247,
                  height: ManagerHeight.h234,
                )),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w16, vertical: ManagerHeight.h26),
              child: GetBuilder<VereificationController>(
                  init: VereificationController(),
                  builder: (controller) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: ManagerWidth.w34),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              ManagerStrings.verifyEmail,
                              style: getMediumTextStyle(
                                fontSize: ManagerFontSize.s18,
                                color: ManagerColors.textColor,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: ManagerWidth.w22),
                          child: Text(
                            ManagerStrings.enterOtpCode,
                            style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: ManagerColors.grey,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h24,
                        ),
                        //verfication
                        ValidationRow(
                          controller: controller,
                        ),
                        SizedBox(
                          height: ManagerHeight.h34,
                        ),
                        mainButton(
                          color: ManagerColors.primaryColor,
                          height: ManagerHeight.h48,
                          minWidth: double.infinity,
                          elevation: 0.1,
                          shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            ManagerStrings.verify,
                            style: getMediumTextStyle(
                                fontSize: 14, color: ManagerColors.white),
                          ),
                          onPressed: () {
                            //api
                            //got to resetpass screen
                            controller.gotoResetPassScreen();
                          },
                        ),
                        SizedBox(
                          height: ManagerHeight.h18,
                        ),
                        Text(
                          ManagerStrings.notSentYet,
                          style: getRegularTextStyle(
                            fontSize: 14,
                            color: ManagerColors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        mainButton(
                          child: Text(
                            ManagerStrings.resendit,
                            style: getMediumTextStyle(
                                fontSize: 14,
                                color: ManagerColors.primaryColor,
                                decoration: TextDecoration.underline),
                          ),
                          onPressed: () {
                            //api
                          },
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ValidationRow extends StatelessWidget {
  VereificationController? controller;
  ValidationRow({
    super.key,
    this.controller,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      children: [
        CodeVerification(
          controller: controller!.firstCodeTextController,
          focusNode: controller!.firstFocusNode,
          previousFocusNode: controller!.firstFocusNode,
          onChanged: (String value) {
            if (value.isNotEmpty) {
              controller!.secondFocusNode.requestFocus();
            }
          },
          validator: (value) => controller!.validator.validateCode(value),
        ),
        SizedBox(
          width: ManagerWidth.w10,
        ),
        CodeVerification(
          controller: controller!.secondCodeTextController,
          focusNode: controller!.secondFocusNode,
          previousFocusNode: controller!.firstFocusNode,
          onChanged: (String value) {
            if (value.isNotEmpty) {
              controller!.thirdFocusNode.requestFocus();
            } else {
              controller!.firstFocusNode.requestFocus();
            }
          },
          validator: (value) => controller!.validator.validateCode(value),
        ),
        SizedBox(
          width: ManagerWidth.w10,
        ),
        CodeVerification(
          controller: controller!.thirdCodeTextController,
          focusNode: controller!.thirdFocusNode,
          previousFocusNode: controller!.secondFocusNode,
          onChanged: (String value) {
            if (value.isNotEmpty) {
              controller!.fourthFocusNode.requestFocus();
            }
          },
          validator: (value) => controller!.validator.validateCode(value),
        ),
        SizedBox(
          width: ManagerWidth.w10,
        ),
        CodeVerification(
          controller: controller!.fourthCodeTextController,
          focusNode: controller!.fourthFocusNode,
          previousFocusNode: controller!.thirdFocusNode,
          onChanged: (String value) {
            if (value.isNotEmpty) {
              controller!.fifthFocusNode.requestFocus();
            }
          },
          validator: (value) => controller!.validator.validateCode(value),
        ),
        SizedBox(
          width: ManagerWidth.w10,
        ),
        CodeVerification(
          controller: controller!.fifthCodeTextController,
          focusNode: controller!.fifthFocusNode,
          previousFocusNode: controller!.fourthFocusNode,
          onChanged: (String value) {
            if (value.isNotEmpty) {
              controller!.sixthFocusNode.requestFocus();
            }
          },
          validator: (value) => controller!.validator.validateCode(value),
        ),
        SizedBox(
          width: ManagerWidth.w10,
        ),
        CodeVerification(
          controller: controller!.sixthCodeTextController,
          focusNode: controller!.sixthFocusNode,
          previousFocusNode: controller!.fifthFocusNode,
          onChanged: (String value) {
            if (value.isNotEmpty) {
              // controller.verifyEmail(context);
            }
          },
          validator: (value) => controller!.validator.validateCode(value),
        ),
      ],
    );
  }
}
