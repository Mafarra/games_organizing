import 'package:flutter/material.dart';
import 'package:games_organizing/routes/routes.dart';
import 'package:get/get.dart';
import '../resources/manager_color.dart';
import '../resources/manager_strings.dart';
import '../resources/manager_styles.dart';
import '../resources/managers_size.dart';
import 'main_button.dart';

myDialoge() {
  Get.generalDialog(
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (context, anim1, anim2) {
      return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Align(
          alignment: Alignment.center,
          child: AlertDialog(
            icon: const Icon(
              Icons.check_circle_rounded,
              size: 66,
            ),
            iconColor: ManagerColors.primaryColor,
            // title: Text('My Dialog'),
            content: Text(
              ManagerStrings.successResetPassword,
              style: getMediumTextStyle(
                fontSize: 16,
                color: ManagerColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            actions: [
              mainButton(
                color: ManagerColors.primaryColor,
                height: ManagerHeight.h48,
                minWidth: double.infinity,
                elevation: 0.1,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  ManagerStrings.goBack,
                  style: getMediumTextStyle(
                      fontSize: 14, color: ManagerColors.white),
                ),
                onPressed: () {
                  //api
                  Get.back();
                  Get.offAllNamed(Routes.loginView);
                },
              ),
            ],
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
  );
}
