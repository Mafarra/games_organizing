import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_color.dart';
import '../../../../routes/routes.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool rememberMeCheckBoxValue = false;

  Icon showIconVisible() {
    return Icon(
      passwordVisible ? Icons.visibility : Icons.visibility_off,
      color: ManagerColors.grey,
    );
  }

  void changeIconVisibility() {
    passwordVisible = !passwordVisible;
    update();
  }

  void changeRememberMeCheckBoxValue() {
    rememberMeCheckBoxValue = !rememberMeCheckBoxValue;
    update();
  }

  gotoRigisterScreen() {
    Get.offAllNamed(Routes.registerView);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    email.dispose();
    password.dispose();
  }
}
