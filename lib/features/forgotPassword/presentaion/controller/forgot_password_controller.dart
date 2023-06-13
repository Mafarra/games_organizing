import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordConteroller extends GetxController {
  late TextEditingController email = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    email.dispose();
  }
}
