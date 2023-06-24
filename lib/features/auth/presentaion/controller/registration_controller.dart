import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import 'package:games_organizing/core/resources/manager_assets.dart';
import 'package:games_organizing/features/auth/domain/gender_model.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../routes/routes.dart';

class RegisterController extends GetxController {
  late TextEditingController fullName = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();
  late String genderType = '';
  late String birthDate = '';
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool policyBoxValue = false;
  List<GenderModel> genderItems = [
    GenderModel(
      genderType: 'ذكر',
      id: 1,
      svgPic: ManagerAssets.male,
      isChecked: false,
      color: ManagerColors.grey,
    ),
    GenderModel(
      genderType: 'أنثى',
      id: 2,
      svgPic: ManagerAssets.female,
      isChecked: false,
      color: ManagerColors.grey,
    ),
  ];
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

  void changePolicyBoxValue() {
    policyBoxValue = !policyBoxValue;
    update();
  }

  bool ischecked(GenderModel genderModel) {
    return genderModel.isChecked.onNull();
  }

  void changedcheckedValue(GenderModel genderModel) {
    genderModel.isChecked = !genderModel.isChecked.onNull();
    saveGenderType(genderModel);
    update();
  }

  changeBorderColorOnCheck(GenderModel genderModel) {
    cleargendersColor();
    ischecked(genderModel)
        ? genderModel.color = ManagerColors.primaryColor
        : genderModel.color = ManagerColors.grey;
    update();
  }

  void saveGenderType(GenderModel genderModel) {
    genderType = genderModel.genderType.onNull();
    update();
  }

  void clearCheckedgenders() {
    genderItems[0].isChecked = false;
    genderItems[1].isChecked = false;
    update();
  }

  void cleargendersColor() {
    genderItems[0].color = ManagerColors.grey;
    genderItems[1].color = ManagerColors.grey;
    update();
  }

  gotoLoginScreen() {
    Get.offAllNamed(Routes.loginView);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fullName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    fullName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
  }
}
