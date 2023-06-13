import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/resources/managers_size.dart';
import '../../../../core/widgets/general_dialoge.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../../routes/routes.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  @override
  void onInit() {
    super.onInit();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    password.dispose();
    confirmPassword.dispose();
  }

  void changeIconVisibility() {
    passwordVisible = !passwordVisible;
    update();
  }

  Icon showIconVisible() {
    return Icon(
      passwordVisible ? Icons.visibility : Icons.visibility_off,
      color: ManagerColors.grey,
    );
  }

  showMyDialoge() {
    myDialoge();
  }
}
