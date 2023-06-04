import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/manager_fonts.dart';
import 'package:games_organizing/core/resources/manager_styles.dart';
import 'package:games_organizing/core/resources/managers_size.dart';
import 'package:games_organizing/features/auth/presentaion/view/widgets/custom_paint_child.dart';
import 'package:games_organizing/features/auth/presentaion/view/widgets/login_custom_paint.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widgets/base_text_form_field.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  final FailedValidator _failedValidator = FailedValidator();
  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: loginPaint(width: width, child: loginPaintChild),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w16, vertical: ManagerHeight.h24),
              child: GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (controller) {
                    return Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: ManagerWidth.w14),
                            child: Text(
                              ManagerStrings.signIn,
                              style: getMediumTextStyle(
                                fontSize: ManagerFontSize.s18,
                                color: ManagerColors.textColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: ManagerWidth.w22),
                            child: Text(
                              ManagerStrings.welcomeAgain,
                              style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s16,
                                color: ManagerColors.grey,
                              ),
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
                            controller: controller.email,
                            hintText: ManagerStrings.email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>
                                _failedValidator.validateEmail(
                              value,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
