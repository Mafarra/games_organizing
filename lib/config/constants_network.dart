// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import '../core/util/sh_util.dart';

abstract class ConstanceNetwork {
  /// here insert base_url
  static String baseUrl = "https:example.com";
  static String baseUrlImage = "jobme.me/public/images/profile/";
  static String baseUrlCompanyImage =
      "https://jobme.me/public/images/profile/company/";
  /// here insert key Of Request
  static String resultKey = "data";
  //this for login keys
  static String userNameKey = "username";
  static String userTypeKey = "user_type";
  static String passwordKey = "password";
  static String fullNameKey = "fullname";
  static String emailKey = "email";
  static String passwordConfirmKey = "password_confirm";
  static String passwordNewKey = "password_new";
  static String fcmToken = "fcm_token";

  static Map<String, String> userHeader(int typeToken) {
    Map<String, String> headers = {};
    if (typeToken == 0) {
      headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Language': (Get.locale != null
            ? Get.locale.toString().split("_")[0]
            : "${SharedPref.instance.getAppLanguageMain()?.languageCode.toString()}"),
      };
    } else if (typeToken == 1) {
      headers = {
        // 'Authorization':
        //     'Bearer ${SharedPref.instance.getUserData().token}',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Language': (Get.locale != null
            ? Get.locale.toString().split("_")[0]
            : "${SharedPref.instance.getAppLanguageMain()?.languageCode.toString()}"),
        'Accept': 'application/json',
      };
    } else if (typeToken == 2) {
      headers = {
        // 'Authorization':
        //     'Bearer  ${SharedPref.instance.getUserData().token }}',
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
        //     'Bearer ${SharedPref.instance.getUserData().token}',
        'Content-Type': 'application/json',
        'Language': (Get.locale != null
            ? Get.locale.toString().split("_")[0]
            : "${SharedPref.instance.getAppLanguageMain()?.languageCode.toString()}"),
        'Accept': 'application/json',
      };
    } else if (typeToken == 5) {
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
