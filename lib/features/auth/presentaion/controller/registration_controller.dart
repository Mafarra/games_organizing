import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import 'package:games_organizing/core/resources/manager_assets.dart';
import 'package:games_organizing/core/resources/manager_strings.dart';
import 'package:games_organizing/features/auth/domain/model/gender_model.dart';
import 'package:games_organizing/features/home/presentation/view/home_view.dart';
import 'package:games_organizing/features/main/presentation/view/main_view.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../config/constants_network.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/util/app_shaerd_data.dart';
import '../../../../core/util/sh_util.dart';
import '../../../../routes/routes.dart';
import '../../data/auth_feature.dart';

class RegisterController extends GetxController {
  late TextEditingController fullName = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmPassword = TextEditingController();
  late int genderType = 1;
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool policyBoxValue = false;
  bool isLoading = false;
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

  //click on sign in btn on login page
  void signUpValid() {
    if (password.text != confirmPassword.text) {
      snackError("", ManagerStrings.errorPasswordMatches.tr);
      return;
    }
    if (!policyBoxValue) {
      snackError("", ManagerStrings.acceptPolicyConditions.tr);
      return;
    }
    Map<String, dynamic> map = {
      ConstanceNetwork.nameKey: fullName.text.toString(),
      ConstanceNetwork.passwordKey: password.text.toString(),
      ConstanceNetwork.passwordConfirmKey: confirmPassword.text.toString(),
      ConstanceNetwork.emailKey: email.text.toString(),
      ConstanceNetwork.genderKey: genderType,
    };
    SharedPref.instance.setUserName(fullName.text.toString());
    SharedPref.instance.setPasswordUser(password.text.toString());
    _signUp(map);
  }

  //make signIn methode
  Future<void> _signUp(Map<String, dynamic> map) async {
    try {
      startLoading();
      await UserAuthFeature.getInstance.signUp(map).then((value) async {
        //handle object from value || [save in sharedPreferences]
        Logger().d(value.toJson());
        // await SharedPref.instance.setUserLogin(true);
        await Get.offAllNamed(Routes.mainView);
        endLoading();
        snackSuccess(ManagerStrings.success, ManagerStrings.success);
      }).catchError((onError) {
        //handle error from value
        snackError("Error", onError.toString());
        Logger().d(onError.toString());
        endLoading();
      });
    } catch (e) {
      snackError("Error", ManagerStrings.noInternetConnection.tr);
      Logger().d(e.toString());
      endLoading();
    }
  }

  void startLoading() {
    isLoading = true;
    update();
  }

  void endLoading() {
    isLoading = false;
    update();
  }

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
    genderType = genderModel.id.onNull();
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
