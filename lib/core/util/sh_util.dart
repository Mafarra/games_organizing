import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/localization/localization_service.dart';

class SharedPref {
  static SharedPref instance = SharedPref._();

  SharedPref._();

  factory SharedPref() => instance;

  final String fcmKey = "fcm";
  final String langKey = "langKey";
  final String userDataCompanyKey = "userDataCompany";
  final String loginCompanyKey = "loginCompany";
  final String userNameCompanyKey = "userNameCompany";
  final String passwordCompanyKey = "passwordCompany";
  final String userDataKey = "userData";
  final String userProfileDataKey = "userProfileData";
  final String loginUserKey = "loginUser";
  final String userNameKey = "userNameUser";
  final String userpasswordKey = "passwordUser";
  final String clientTypeKey = "clientTypeKey"; 
  final String userNameSocialKey = "UserNameSocial";
  final String emailSocialKey = "setEmailSocial";
  final String imageSocialKey = "setImageSocial";
  final String idSocialKey = "setIdSocial";
  final String idSocialCompanyKey = "idSocialCompanyKey";
  final String socialTypeKey = "setSocialType";
  final String socialHandlerKey = "SocialHandler";
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

  String getFCMToken() {
    return _prefs!.getString(fcmKey) ?? "";
  }

  setIsUserKey(bool isUser) async {
    try {
      await _prefs?.setBool(clientTypeKey, isUser);
    } catch (e) {
      printError(info: e.toString());
    }
  }

  bool getIsUserKey() {
    return _prefs!.getBool(clientTypeKey) ?? true;
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

  // setUserBalance(BalanceData value) async {
  //   try {
  //     var userData = getUserData();
  //     userData.balance = value.balance.toString();
  //     userData.finish = value.finish;
  //     setUserData(jsonEncode(userData.toJson()));
  //     await _prefs?.setString(userBalanceKey, jsonEncode(userData.toJson()));
  //   } catch (e) {
  //     Logger().e(e);
  //     return "$e";
  //   }
  // }
  //
  setUserDataCompany(String profileData) async {
    try {
      await _prefs?.setString(userDataCompanyKey, profileData.toString());
    } catch (e) {
      Logger().e(e);
      return "$e";
    }
  }


  //clear
  clear() async {
    _prefs?.remove(userDataKey);
    _prefs?.remove(fcmKey);
    _prefs?.remove(passwordCompanyKey);
    _prefs?.remove(idSocialCompanyKey);
    // _prefs?.remove(userProfileDataKey);
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

  // UserDataModel getUserData() {
  //   try {
  //     var string = _prefs?.getString(userDataKey) ?? "";
  //     var decode = json.decode(string);
  //     UserDataModel profileData = UserDataModel.fromJson(decode);
  //     return profileData;
  //   } catch (e) {
  //     Logger().e(e);
  //     return UserDataModel();
  //   }
  // }

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

  void setUserNameSocial(String fullNameKey) {
    try {
      _prefs?.setString(userNameSocialKey , fullNameKey) ;
    } catch (e) {
      Logger().e(e);
    }
  }

  void setEmailSocial(String emailKey) {

    try {
      _prefs?.setString(emailSocialKey , emailKey) ;
    } catch (e) {
      Logger().e(e);
    }
  }

  void setImageSocial(String imageKey) {

    try {
      _prefs?.setString(imageSocialKey , imageKey) ;
    } catch (e) {
      Logger().e(e);
    }
  }

  void setIdSocial(String socialId) {

    try {
      _prefs?.setString(idSocialKey , socialId) ;
    } catch (e) {
      Logger().e(e);
    }
  }

  void setIdSocialCompany(String socialId) {

    try {
      _prefs?.setString(idSocialCompanyKey , socialId) ;
    } catch (e) {
      Logger().e(e);
    }
  }

  void setSocialType(String socialType) {

    try {
      _prefs?.setString(socialTypeKey , socialType) ;
    } catch (e) {
      Logger().e(e);
    }
  }




  String getUserNameSocial() {
    try {
      return _prefs?.getString(userNameSocialKey ) ??"" ;
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }

  String getEmailSocial() {

    try {
      return _prefs?.getString(emailSocialKey ) ??"";
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }

  String getImageSocial() {

    try {
      return _prefs?.getString(imageSocialKey ) ??"";
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }

  String getIdSocial() {

    try {
      return _prefs?.getString(idSocialKey) ?? "" ;
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }

  String getIdSocialCompany() {

    try {
      return _prefs?.getString(idSocialCompanyKey) ?? "" ;
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }

  String getSocialType() {

    try {
      return _prefs?.getString(socialTypeKey )??"" ;
    } catch (e) {
      Logger().e(e);
      return "";
    }
  }

  storeSocialHandler(bool isHide){
    _prefs?.setBool(socialHandlerKey, isHide);
  }

  bool getStoreSocialHandler(){
    return  _prefs?.getBool(socialHandlerKey )?? false;
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
