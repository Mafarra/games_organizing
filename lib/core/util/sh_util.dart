import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/domain/model/user_data_model.dart';
import '../service/localization/localization_service.dart';

class SharedPref {
  static SharedPref instance = SharedPref._();

  SharedPref._();

  factory SharedPref() => instance;
  static const String outBoardingViewedKey = "out_boarding_viewed";
  final String fcmKey = "fcm";
  final String langKey = "langKey";
  final String userDataKey = "userData";
  final String userProfileDataKey = "userProfileData";
  final String loginUserKey = "login";
  final String userNameKey = "userName";
  final String userpasswordKey = "password";
  static SharedPreferences? _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  setFCMToken(String fcmToken) async {
    try {
      _prefs?.setString(fcmKey, fcmToken);
    } catch (e) {
      printError(info: e.toString());
    }
  }
Future<void> setOutBoardingViewed() async {
    await _prefs?.setBool(
        outBoardingViewedKey, true);
  }

  bool getOutBoardingViewed() {
    return _prefs!.getBool(outBoardingViewedKey).onNull();
  }
  String getFCMToken() {
    return _prefs!.getString(fcmKey) ?? "";
  }


  Future<void> setAppLang(String lang) async {
    try {
      if (!GetUtils.isNull(lang)) {
        await _prefs?.setString(langKey, lang);
        LocalizationService().changeLocale(lang);
        // loginAgain();
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }

  Locale? getAppLanguageMain() {
    try {
      var string = _prefs?.getString(langKey);
      if (string != null &&
          string == LocalizationService.langs[LocalizationService.arIndex]) {
        return LocalizationService.localeAr;
      } else if (string != null &&
          string == LocalizationService.langs[LocalizationService.enIndex]) {
        return LocalizationService.localeEn;
      } else {
        return LocalizationService.localeAr;
      }
    } catch (e) {
      printError(info: e.toString());
      return LocalizationService.localeAr;
    }
  }

  //clear
  clear() async {
    _prefs?.remove(userDataKey);
    _prefs?.remove(fcmKey);
  }

//////////////////////////////////////////User part/////////////////////////////
  ///
  setUserData(String profileData) async {
    try {
      await _prefs?.setString(userDataKey, profileData.toString());
    } catch (e) {
      Logger().e(e);
      return "$e";
    }
  }

  UserDataModel getUserData() {
    try {
      var string = _prefs?.getString(userDataKey) ?? "";
      var decode = json.decode(string);
      UserDataModel profileData = UserDataModel.fromJson(decode);
      return profileData;
    } catch (e) {
      Logger().e(e);
      return UserDataModel();
    }
  }

  setUserProfileData(String profileData) async {
    try {
      await _prefs?.setString(userProfileDataKey, profileData.toString());
    } catch (e) {
      Logger().e(e);
      return "$e";
    }
  }

  // void setUserDataUpdated(json) {
  //   try {
  //     var userData = getUserProfileData();
  //     userData.email = json["email"].toString();
  //     userData.firstName = json["fullname"].toString();
  //     userData.lastName = json["l_name"].toString();
  //     userData.picture = json["picture"].toString();
  //     userData.phone = json["phone"].toString();
  //     userData.dob = json["dob"];
  //     userData.city = json["city"].toString();
  //     userData.gender = json["gender"].toString();
  //     // userData.jobType = json["full_part_time"];
  //     setUserProfileData(jsonEncode(userData.toJson()));
  //   } catch (e) {
  //     Logger().e(e);
  //   }
  // }

  // UserProfileDataModel getUserProfileData() {
  //   try {
  //     var string = _prefs?.getString(userProfileDataKey) ?? "";
  //     var decode = json.decode(string);
  //     UserProfileDataModel profileData = UserProfileDataModel.fromJson(decode);
  //     return profileData;
  //   } catch (e) {
  //     Logger().e(e);
  //     return UserProfileDataModel();
  //   }
  // }

  setUserLogin(bool isUserLogin) async {
    try {
      await _prefs?.setBool(loginUserKey, isUserLogin);
    } catch (e) {
      Logger().e(e);
      return "$e";
    }
  }

  bool getIsUserLogin() {
    try {
      return _prefs?.getBool(loginUserKey) ?? false;
    } catch (e) {
      Logger().e(e);
      return false;
    }
  }

  setUserName(String userName) async {
    try {
      await _prefs?.setString(userNameKey, userName);
    } catch (e) {
      Logger().e(e);
      return "$e";
    }
  }

  String getUserName() {
    try {
      return _prefs?.getString(userNameKey) ?? "";
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }

  setPasswordUser(String password) async {
    try {
      await _prefs?.setString(userpasswordKey, password);
    } catch (e) {
      Logger().e(e);
      return "$e";
    }
  }

  String getPassword() {
    try {
      return _prefs?.getString(userpasswordKey) ?? "";
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }

  // void setUserDataUpdated(json) {
  //   try {
  //     var userData = getUserData();
  //     userData.email = json["email"].toString();
  //     userData.fullname = json["fullname"].toString();
  //     userData.picture = json["picture"].toString();
  //     setUserData(jsonEncode(userData.toJson()));
  //   } catch (e) {
  //     Logger().e(e);
  //   }
  // }
  //
  // setUserDataVerify() {
  //   try {
  //     var userData = getUserData();
  //     userData.isVerify =true;
  //     setUserData(jsonEncode(userData.toJson()));
  //   } catch (e) {
  //     Logger().e(e);
  //   }
  // }
}
