import 'package:games_organizing/features/auth/data/auth_model.dart';
import 'package:logger/logger.dart';

import '../../../config/constants_network.dart';
import '../../../core/util/app_shaerd_data.dart';
import '../domain/model/user_data_model.dart';

class UserAuthFeature {
  UserAuthFeature._();
  static final UserAuthFeature getInstance = UserAuthFeature._();
  factory UserAuthFeature() => getInstance;

  Future<UserDataModel> signUp(Map<String, dynamic> body) async {
    var appResponse = await UserAuthModel.getInstance.signUpUserRequest(
        body: body,
        url: ConstanceNetwork.register,
        header: ConstanceNetwork.header(0));
    if (appResponse.status == true) {
      Logger().d("if ${appResponse.toJson()}");
      return UserDataModel.fromJson(appResponse.data ?? {});
    } else {
      snackError("", appResponse.message);
      Logger().d("else ${appResponse.toJson()}");
      return UserDataModel.fromJson(appResponse.data ?? {});
    }
  }
/*
  Future<UserDataModel> loginUser(Map<String, dynamic> body) async {
    var appResponse = await UserAuthModel.getInstance.loginUserRequest(
        body: body,
        url: ConstanceNetwork.loginApi,
        header: ConstanceNetwork.userHeader(3));
    if (appResponse.status == true) {
      Logger().d("if ${appResponse.toJson()}");
      return UserDataModel.fromJson(appResponse.result ?? {});
    } else {
      snackError("", appResponse.message);
      Logger().d("else ${appResponse.toJson()}");
      return UserDataModel.fromJson(appResponse.result ?? {});
    }
  }

  Future<AppResponse> logoutUser() async {
    var appResponse = await UserAuthModel.getInstance.logoutUserRequest(
        url: ConstanceNetwork.logoutApi, header: ConstanceNetwork.userHeader(5));
    if (appResponse.status == true) {
      Logger().d("if ${appResponse.toJson()}");
      return appResponse;
    } else {
      // snackError("",appResponse.message);
      Logger().d("else ${appResponse.toJson()}");
      return appResponse;
    }
  }

  Future<AppResponse> deleteUserAccount() async {
    var appResponse = await UserAuthModel.getInstance.deleteUserAccount(
        url: ConstanceNetwork.deleteUserApi,
        header: ConstanceNetwork.userHeader(5));
    if (appResponse.status == true) {
      Logger().d("if ${appResponse.toJson()}");
      return appResponse;
    } else {
      // snackError("",appResponse.message);
      Logger().d("else ${appResponse.toJson()}");
      return appResponse;
    }
  }

  Future<AppResponse> sendUserEmail(var parameters) async {
    var appResponse = await UserAuthModel.getInstance.sendUserEmail(
      url: ConstanceNetwork.sendEmailVerifyApi,
      body: {ConstanceNetwork.emailKey: parameters},
      header: ConstanceNetwork.userHeader(1),
    );
    if (appResponse.status == true) {
      Logger().d("if ${appResponse.toJson()}");
      return appResponse;
    } else {
      Logger().d("else ${appResponse.toJson()}");
      return appResponse;
    }
  }

  Future<AppResponse> confirmEmail(Map<String, dynamic> body) async {
    var appResponse = await UserAuthModel.getInstance.confirmUserEmail(
      url: ConstanceNetwork.confirmVerifyEmailApi,
      header: ConstanceNetwork.userHeader(1),
      body: body,
    );
    if (appResponse.status == true) {
      Logger().d("if ${appResponse.toJson()}");
      return appResponse;
    } else {
      // snackError("",appResponse.message);
      Logger().d("else ${appResponse.toJson()}");
      return appResponse;
    }
  }

  Future<AppResponse> sendForgetEmail(var userEmail) async {
    var appResponse = await UserAuthModel.getInstance.sendForgetEmail(
      url: "${ConstanceNetwork.sendForgetEmailApi}$userEmail",
      header: ConstanceNetwork.userHeader(0),
    );
    if (appResponse.status == true) {
      Logger().d("if ${appResponse.toJson()}");
      return appResponse;
    } else {
      // snackError("",appResponse.message);
      Logger().d("else ${appResponse.toJson()}");
      return appResponse;
    }
  }

  Future<AppResponse> confirmForgetPasswordAndChange(
      Map<String, dynamic> body) async {
    //confirm
    var appResponse = await UserAuthModel.getInstance
        .confirmUserForgetPasswordAndChange(
            body: body,
            url: ConstanceNetwork.confirmForgetPasswordAndChangeApi,
            header: ConstanceNetwork.userHeader(3));
    if (appResponse.status == true) {
      Logger().d("if ${appResponse.toJson()}");
      return appResponse;
    } else {
      // snackError("",appResponse.message);
      Logger().d("else ${appResponse.toJson()}");
      return appResponse;
    }
  }
    Future<UserDataModel> socialLoginUser(Map<String, dynamic> body) async {
    var appResponse = await UserAuthModel.getInstance.socialLoginRequest(
        body: body,
        url: ConstanceNetwork.loginSocialMediaApi,
        header: ConstanceNetwork.userHeader(3));
    if (appResponse.status == true) {
      Logger().d("if ${appResponse.toJson()}");
      return UserDataModel.fromJson(appResponse.result ?? {});
    } else {
      snackError("",appResponse.message);
      Logger().d("else ${appResponse.toJson()}");
      return UserDataModel.fromJson(appResponse.result ?? {});
    }
  }
  Future<UserDataModel> refreshLoginSocialMediaForUser(Map<String, dynamic> body) async {
    var appResponse = await UserAuthModel.getInstance.refreshLoginSocialMediaApi(
        body: body,
        url: ConstanceNetwork.refreshLoginSocialMediaApi,
        header: ConstanceNetwork.userHeader(3));
    if (appResponse.status == true) {
      Logger().d("if refreshLoginSocialMediaApi: ${appResponse.toJson()}");
      return UserDataModel.fromJson(appResponse.result ?? {});
    } else {
      // snackError("",appResponse.message);
      Logger().d("else ${appResponse.toJson()}");
      return UserDataModel.fromJson(appResponse.result ?? {});
    }
  }

  //
  // Future<AppResponse> updateProfile(Map<String, dynamic> body) async {
  //   var appResponse = await UserAuthModel.getInstance.updateProfile(
  //       body: body,
  //       url: ConstanceNetwork.updateProfile,
  //       header: ConstanceNetwork.userHeader(2));
  //   if (appResponse.status == true) {
  //     Logger().d("if ${appResponse.toJson()}");
  //     return appResponse;
  //   } else {
  //     snackError("",appResponse.message);
  //     Logger().d("else ${appResponse.toJson()}");
  //     return appResponse;
  //   }
  // }

  // Future<AppResponse> getAppSettings() async{
  //   var appResponse = await UserAuthModel.getInstance.getAppSettings(
  //       url: ConstanceNetwork.settingApi,
  //       header: ConstanceNetwork.userHeader(0));
  //   if (appResponse.status == true) {
  //     Logger().d("if ${appResponse.toJson()}");
  //     return appResponse;
  //   } else {
  //     snackError("",appResponse.message);
  //     Logger().d("else ${appResponse.toJson()}");
  //     return appResponse;
  //   }
  // }
  */
}
