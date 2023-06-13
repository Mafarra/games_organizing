// ignore_for_file: file_names, duplicate_ignore
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/manager_assets.dart';
import 'package:games_organizing/core/resources/manager_strings.dart';
import 'package:games_organizing/core/resources/manager_styles.dart';
import 'package:games_organizing/core/widgets/main_button.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/managers_size.dart';
import '../../../../routes/routes.dart';
import '../controller/choose_account_controller.dart';

class ChooseAccountView extends StatelessWidget {
  const ChooseAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white10, Colors.black87, Colors.black87],
              ),
              image: DecorationImage(
                opacity: 0.4,
                image: AssetImage(
                  ManagerAssets.chooseAccountPackgroundImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ManagerHeight.h16, vertical: ManagerHeight.h60),
            child: GetBuilder<ChooseAccountController>(
                init: ChooseAccountController(),
                builder: (controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ManagerStrings.chooseAccountText1,
                        style: getMediumTextStyle(
                          fontSize: 14,
                          color: ManagerColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: ManagerHeight.h24,
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
                        onPressed: () => Get.offAllNamed(Routes.mainView)
                        // controller.gotoSigninScreen(),
                      ),
                      SizedBox(
                        height: ManagerHeight.h16,
                      ),
                      mainButton(
                        color: ManagerColors.white,
                        height: ManagerHeight.h48,
                        minWidth: double.infinity,
                        elevation: 0.1,
                        shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          ManagerStrings.signUp,
                          style: getMediumTextStyle(
                              fontSize: 14, color: ManagerColors.primaryColor),
                        ),
                        onPressed: () => controller.gotoRegisterScreen(),
                      ),
                      SizedBox(
                        height: ManagerHeight.h24,
                      ),
                      mainButton(
                        child: Text(
                          ManagerStrings.chooseAccountText2,
                          style: getMediumTextStyle(
                            fontSize: 14,
                            color: ManagerColors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
