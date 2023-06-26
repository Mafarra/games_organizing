import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../config/constants_network.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/util/app_shaerd_data.dart';
import '../../../../core/util/sh_util.dart';
import '../../../../routes/routes.dart';
import '../../data/auth_feature.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
  bool rememberMeCheckBoxValue = false;
  bool isLoading = false;

  //click on sign in btn on login page
  void signInValid() {
    Map<String, dynamic> map = {
      ConstanceNetwork.emailKey: email.text.toString(),
      ConstanceNetwork.passwordKey: password.text.toString(),
      // ConstanceNetwork.fcmToken: SharedPref.instance.getFCMToken(),
    };
    SharedPref.instance.setUserName(email.text.toString());
    SharedPref.instance.setPasswordUser(password.text.toString());
    _signIn(map);
  }

//make signIn methode
  Future<void> _signIn(
    Map<String, dynamic> map,
  ) async {
    try {
      startLoading();
      await UserAuthFeature.getInstance.loginUser(map).then((value) async {
        if (value.token != null) {
          await SharedPref.instance.setUserLogin(true);
          await Get.offAllNamed(Routes.mainView);
          endLoading();
        }
        endLoading();
      }).catchError((onError) {
        endLoading();
        snackError("", onError.toString());
        Logger().d(onError.toString());
      });
    } catch (e) {
      snackError("", e.toString());
      Logger().d(e.toString());
      endLoading();
    }
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

  void startLoading() {
    isLoading = true;
    update();
  }

  void endLoading() {
    isLoading = false;
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    email.dispose();
    password.dispose();
  }
}
