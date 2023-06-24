// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/validator/validator.dart';
import '../../../../routes/routes.dart';

class VereificationController extends GetxController {
  late TextEditingController firstCodeTextController;
  late TextEditingController secondCodeTextController;
  late TextEditingController thirdCodeTextController;
  late TextEditingController fourthCodeTextController;
  late TextEditingController fifthCodeTextController;
  late TextEditingController sixthCodeTextController;
  FieldValidator validator = FieldValidator();
  var formKey = GlobalKey<FormState>();

  late FocusNode firstFocusNode;
  late FocusNode secondFocusNode;
  late FocusNode thirdFocusNode;
  late FocusNode fourthFocusNode;
  late FocusNode fifthFocusNode;
  late FocusNode sixthFocusNode;

  @override
  void onInit() {
    super.onInit();
    firstCodeTextController = TextEditingController();
    secondCodeTextController = TextEditingController();
    thirdCodeTextController = TextEditingController();
    fourthCodeTextController = TextEditingController();
    fifthCodeTextController = TextEditingController();
    sixthCodeTextController = TextEditingController();
    firstFocusNode = FocusNode();
    secondFocusNode = FocusNode();
    thirdFocusNode = FocusNode();
    fourthFocusNode = FocusNode();
    fifthFocusNode = FocusNode();
    sixthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    firstCodeTextController.dispose();
    secondCodeTextController.dispose();
    thirdCodeTextController.dispose();
    fourthCodeTextController.dispose();
    fifthCodeTextController.dispose();
    sixthFocusNode.dispose();
    firstFocusNode.dispose();
    secondFocusNode.dispose();
    thirdFocusNode.dispose();
    fourthFocusNode.dispose();
    fifthFocusNode.dispose();
    sixthFocusNode.dispose();
    formKey.currentState!.dispose();
  }

  void gotoResetPassScreen() {
    Get.offAllNamed(Routes.resetPasswordView);
  }
}
