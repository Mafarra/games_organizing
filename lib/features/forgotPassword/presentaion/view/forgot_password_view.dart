import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:games_organizing/core/resources/manager_assets.dart';
import 'package:games_organizing/core/resources/managers_size.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widgets/base_text_form_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../routes/routes.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPassword extends StatelessWidget {
  final FieldValidator _failedValidator = FieldValidator();

  ForgotPassword({super.key});

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
                  // bottom: ManagerHeight.h26,
                ),
                child: SvgPicture.asset(
                  ManagerAssets.forgotPassIllustration,
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
              child: GetBuilder<ForgotPasswordConteroller>(
                  init: ForgotPasswordConteroller(),
                  builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: ManagerWidth.w14),
                          child: Text(
                            ManagerStrings.reEnterPassword,
                            style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s18,
                              color: ManagerColors.textColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: ManagerWidth.w22),
                          child: Text(
                            ManagerStrings.reEnterEmailpls,
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
                          ManagerStrings.email,
                          style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s12,
                            color: ManagerColors.textColor,
                          ),
                        ),
                        baseTextFormField(
                          icon: const Icon(Icons.email),
                          controller: controller.email,
                          hintText: ManagerStrings.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              _failedValidator.validateEmail(value),
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
                            ManagerStrings.send,
                            style: getMediumTextStyle(
                                fontSize: 14, color: ManagerColors.white),
                          ),
                          onPressed: () =>
                              //api
                              //get to verification => resetpass
                              Get.offAllNamed(Routes.verificatinView),
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
