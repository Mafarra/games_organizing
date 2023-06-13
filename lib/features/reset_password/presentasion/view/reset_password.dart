import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/resources/managers_size.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widgets/base_text_form_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../controller/reset_password_controller.dart';

class ResetPasswordView extends StatelessWidget {
  final FieldValidator _failedValidator = FieldValidator();

  ResetPasswordView({super.key});

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
                  left: ManagerWidth.w50,
                  right: ManagerWidth.w50,
                ),
                child: SvgPicture.asset(
                  ManagerAssets.resetPasswordIllustration,
                  fit: BoxFit.contain,
                  // width: ManagerWidth.w247,
                  // height: ManagerHeight.h234,
                )),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w16, vertical: ManagerHeight.h26),
              child: GetBuilder<ResetPasswordController>(
                  init: ResetPasswordController(),
                  builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: ManagerWidth.w14),
                          child: Text(
                            ManagerStrings.setPassword,
                            style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s18,
                              color: ManagerColors.textColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: ManagerWidth.w22),
                          child: Text(
                            ManagerStrings.newPasswordMustBeNotUsedBefor,
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
                        Text(
                          ManagerStrings.newPassword,
                          style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s12,
                            color: ManagerColors.textColor,
                          ),
                        ),
                        baseTextFormField(
                          icon: const Icon(Icons.lock),
                          controller: controller.password,
                          hintText: ManagerStrings.password,
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: IconButton(
                            onPressed: () {
                              controller.changeIconVisibility();
                            },
                            icon: controller.showIconVisible(),
                          ),
                          obscureText: !controller.passwordVisible,
                          validator: (value) =>
                              _failedValidator.validatePassword(value),
                        ),
                        Text(
                          ManagerStrings.confirmNewPassword,
                          style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s12,
                            color: ManagerColors.textColor,
                          ),
                        ),
                        baseTextFormField(
                          icon: const Icon(Icons.check_circle_rounded),
                          controller: controller.confirmPassword,
                          hintText: ManagerStrings.password,
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: IconButton(
                            onPressed: () {
                              controller.changeIconVisibility();
                            },
                            icon: controller.showIconVisible(),
                          ),
                          obscureText: !controller.passwordVisible,
                          validator: (value) =>
                              _failedValidator.validatePassword(value),
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
                            ManagerStrings.resetPassword,
                            style: getMediumTextStyle(
                                fontSize: 14, color: ManagerColors.white),
                          ),
                          onPressed: () {
                            //api
                            controller.showMyDialoge();
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
