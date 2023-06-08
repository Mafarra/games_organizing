import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/manager_fonts.dart';
import 'package:games_organizing/core/resources/manager_styles.dart';
import 'package:games_organizing/core/resources/managers_size.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widgets/base_text_form_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/auth_screen_widget.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  final FailedValidator _failedValidator = FailedValidator();
  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      child: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: SingleChildScrollView(
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
                    icon: const Icon(Icons.email),
                    controller: controller.email,
                    hintText: ManagerStrings.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => _failedValidator.validateEmail(value),
                  ),
                  SizedBox(
                    height: ManagerHeight.h18,
                  ),
                  Text(
                    ManagerStrings.password,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      mainButton(
                        child: Text(
                          ManagerStrings.forgotPassword,
                          style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s14,
                              color: ManagerColors.grey),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            ManagerStrings.rememberMe,
                            style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s14,
                              color: ManagerColors.black,
                            ),
                          ),
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor: ManagerColors.grey,
                            ),
                            child: Checkbox(
                              value: controller.rememberMeCheckBoxValue,
                              onChanged: (value) {
                                controller.changeRememberMeCheckBoxValue();
                              },
                              activeColor: ManagerColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  ManagerRadius.r4,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
                      ManagerStrings.signIn,
                      style: getMediumTextStyle(
                          fontSize: 14, color: ManagerColors.white),
                    ),
                    onPressed: () {
                      //api login
                    },
                  ),
                  SizedBox(
                    height: ManagerHeight.h18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mainButton(
                        child: Text(
                          ManagerStrings.createAccount,
                          style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        onPressed: () {
                          controller.gotoRigisterScreen();
                        },
                      ),
                      Text(
                        ManagerStrings.haveNotAccount,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
