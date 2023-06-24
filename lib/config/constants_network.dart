// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import '../core/util/sh_util.dart';

abstract class ConstanceNetwork {
  /// here insert base_url
  static String baseUrl = "https://sharkna.online/api";
  static String baseUrlImage = "jobme.me/public/images/profile/";
  static String baseUrlCompanyImage =
      "https://jobme.me/public/images/profile/company/";

  /// here insert key Of Request
  static String register = "/register";

  ///
  /// this for register keys
  static String resultKey = "data";

  //this for login keys
  static String nameKey = "name";
  static String emailKey = "email";
  static String passwordKey = "password";
  static String passwordConfirmKey = "confirm_password";
  static String genderKey = "gender";
  static String passwordNewKey = "password_new";
  static String fcmToken = "fcm_token";

  static Map<String, String> header(int typeToken) {
    Map<String, String> headers = {};
    if (typeToken == 0) {
      headers = {
        'Accept': 'application/json',
        // 'Content-Type': 'application/json',
      };
    } else if (typeToken == 1) {
      headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Language': (Get.locale != null
            ? Get.locale.toString().split("_")[0]
            : "${SharedPref.instance.getAppLanguageMain()?.languageCode.toString()}"),
        'Accept': 'application/json',
      };
    } else if (typeToken == 2) {
      headers = {
        // 'Authorization': 'Bearer  ${SharedPref.instance.getUserData().token}}',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Language': (Get.locale != null
            ? Get.locale.toString().split("_")[0]
            : "${SharedPref.instance.getAppLanguageMain()?.languageCode.toString()}"),
        'Accept': 'application/json',
      };
    } else if (typeToken == 3) {
      headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Language': (Get.locale != null
            ? Get.locale.toString().split("_")[0]
            : "${SharedPref.instance.getAppLanguageMain()?.languageCode.toString()}"),
        'Accept': 'application/json',
      };
    } else if (typeToken == 4) {
      headers = {
        // 'Authorization':
        // 'Bearer ${SharedPref.instance.getUserData().token}',
        'Language': (Get.locale != null
            ? Get.locale.toString().split("_")[0]
            : "${SharedPref.instance.getAppLanguageMain()?.languageCode.toString()}"),
        'Accept': 'application/json',
      };
    }

    return headers;
  }
}
