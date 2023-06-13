import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/manager_fonts.dart';
import 'package:games_organizing/core/resources/manager_styles.dart';
import 'package:games_organizing/core/resources/managers_size.dart';
import 'package:games_organizing/features/auth/presentaion/view/widgets/gender_widget.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widgets/base_text_form_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../core/widgets/auth_screen_widget.dart';
import '../../../../routes/routes.dart';
import '../controller/registration_controller.dart';

class RegisterView extends StatelessWidget {
  final FieldValidator _failedValidator = FieldValidator();
  RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return AuthScreenWidget(
      child: GetBuilder<RegisterController>(
        init: RegisterController(),
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
                      ManagerStrings.createNewAccount,
                      style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s18,
                        color: ManagerColors.textColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: ManagerWidth.w22),
                    child: Text(
                      ManagerStrings.createYourAccountPlz,
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
                    ManagerStrings.fullName,
                    style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s12,
                      color: ManagerColors.textColor,
                    ),
                  ),
                  baseTextFormField(
                    icon: const Icon(Icons.person),
                    controller: controller.fullName,
                    hintText: ManagerStrings.fullNameHint,
                    keyboardType: TextInputType.emailAddress,
                    // validator: (value) => _failedValidator.validateFullName(value),
                  ),
                  SizedBox(
                    height: ManagerHeight.h18,
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
                  SizedBox(
                    height: ManagerHeight.h18,
                  ),
                  Text(
                    ManagerStrings.confirmPassword,
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
                    height: ManagerHeight.h18,
                  ),
                  Text(
                    ManagerStrings.selectGender,
                    style: getBoldTextStyle(
                      fontSize: ManagerFontSize.s12,
                      color: ManagerColors.textColor,
                    ),
                  ),
                  SizedBox(
                    height: ManagerHeight.h12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      genderItem(
                        context: context,
                        genderModel: controller.genderItems[1],
                        controller: controller,
                      ),
                      SizedBox(
                        width: ManagerWidth.w12,
                      ),
                      genderItem(
                        context: context,
                        genderModel: controller.genderItems[0],
                        controller: controller,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ManagerHeight.h16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      mainButton(
                        child: Text(
                          ManagerStrings.agreePolicyConditons,
                          style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black,
                          ),
                        ),
                      ),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor: ManagerColors.grey,
                        ),
                        child: Checkbox(
                          value: controller.policyBoxValue,
                          onChanged: (value) {
                            controller.changePolicyBoxValue();
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
                  SizedBox(
                    height: ManagerHeight.h32,
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
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: ManagerHeight.h18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mainButton(
                          child: Text(
                            ManagerStrings.signIn,
                            style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s14,
                              color: ManagerColors.primaryColor,
                            ),
                          ),
                          onPressed: () {
                            Get.offAllNamed(Routes.loginView);
                          }),
                      Text(
                        ManagerStrings.ihaveAccount,
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
