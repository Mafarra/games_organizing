import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../config/constants_network.dart';
import '../../../core/dio_manager/app_response.dart';
import '../../../core/dio_manager/dio_manage_class.dart';
import '../../../core/util/sh_util.dart';


class UserAuthModel{

  UserAuthModel._();
  static final UserAuthModel getInstance = UserAuthModel._();
  factory UserAuthModel() => getInstance;

  //todo this is for signup request
  Future<AppResponse> signUpUserRequest({var url, var header, var body}) async{
    try {
      var response = await DioManagerClass.getInstance.dioPostMethod(url: url, body: body, header: header);
      if( json.decode(response.toString())[ConstanceNetwork.resultKey]!= null){
        await SharedPref.instance.setUserData(json.encode(json.decode(response.toString())[ConstanceNetwork.resultKey]));
      }
      return AppResponse.fromJson(json.decode(response.toString()));
    } on DioException catch (ex) {
      var message = json.decode(ex.response.toString());
      Logger().e(message);
      return AppResponse.fromJson(message??{});
    }
  }

  //todo this is for login request
  Future<AppResponse> loginUserRequest({var url, var header, var body}) async{
    try {
      var response = await DioManagerClass.getInstance
          .dioPostMethod(url: url, body: body, header: header);
      if( json.decode(response.toString())[ConstanceNetwork.resultKey]!= null){
        await SharedPref.instance.setUserData(json.encode(json.decode(response.toString())[ConstanceNetwork.resultKey]));
      }
      return AppResponse.fromJson(json.decode(response.toString()));
    } on DioException catch (ex) {
      var message = json.decode(ex.response.toString());
      Logger().e(message);
      return AppResponse.fromJson(message??{});
    }
  }

  //todo this is for login request
  Future<AppResponse> logoutUserRequest({var url, var header, var body}) async{
    try {
      var response = await DioManagerClass.getInstance
          .dioGetMethod(url: url, header: header);
      return AppResponse.fromJson(json.decode(response.toString()));
    } on DioException catch (ex) {
      var message = json.decode(ex.response.toString());
      Logger().e(message);
      return AppResponse.fromJson(message??{});
    }
  }

  Future<AppResponse> confirmUserForgetPasswordAndChange({var body, var url, var header}) async{
    try {
      var response = await DioManagerClass.getInstance
          .dioPostMethod(url: url, header: header , body: body);
      return AppResponse.fromJson(json.decode(response.toString()));
    } on DioException catch (ex) {
      var message = json.decode(ex.response.toString());
      Logger().e(message);
      return AppResponse.fromJson(message??{});
    }
  }


  Future<AppResponse> sendUserEmail({var url, var header,var body,}) async{
    try {
      var response = await DioManagerClass.getInstance
          .dioPostMethod(url: url, header: header ,body: body);
      return AppResponse.fromJson(json.decode(response.toString()));
    } on DioException catch (ex) {
      var message = json.decode(ex.response.toString());
      Logger().e(message);
      return AppResponse.fromJson(message??{});
    }
  }


  Future<AppResponse> confirmUserEmail({var url, var header,var body}) async{
    try{
      var response = await DioManagerClass.getInstance
          .dioPostMethod(url: url, header: header,body: body);
      return AppResponse.fromJson(json.decode(response.toString()));
    }on DioException catch (ex) {
      var message = json.decode(ex.response.toString());
      Logger().e(message);
      return AppResponse.fromJson(message??{});
    }
  }
  Future<AppResponse> sendForgetEmail({var url, var header,}) async{
    try{
      var response = await DioManagerClass.getInstance
          .dioGetMethod(url: url, header: header,);
      return AppResponse.fromJson(json.decode(response.toString()));
    }on DioException catch (ex) {
      var message = json.decode(ex.response.toString());
      Logger().e(message);
      return AppResponse.fromJson(message??{});
    }
  }
  Future<AppResponse> confirmUserAccount({var url, var header,var body}) async{
    try{
      var response = await DioManagerClass.getInstance
          .dioPostMethod(url: url, header: header,body: body);
      return AppResponse.fromJson(json.decode(response.toString()));
    }on DioException catch (ex) {
      var message = json.decode(ex.response.toString());
      Logger().e(message);
      return AppResponse.fromJson(message??{});
    }
  }

  Future<AppResponse> deleteUserAccount({var url, var header,}) async{
    try{
      var response = await DioManagerClass.getInstance
          .dioGetMethod(url: url, header: header,);
      return AppResponse.fromJson(json.decode(response.toString()));
    }on DioException catch (ex) {
      var message = json.decode(ex.response.toString());
      Logger().e(message);
      return AppResponse.fromJson(message??{});
    }
  }
  //todo this is for updateProfile request
  Future<AppResponse> updateProfile({var url, var header, var body}) async{
    try {
      var response = await DioManagerClass.getInstance.dioPostFormMethod(url: url, body: body, header: header);
      return AppResponse.fromJson(json.decode(response.toString()));
    } on DioException catch (ex) {
      var message = json.decode(ex.response.toString());
      Logger().e(message);
      return AppResponse.fromJson(message??{});
    }
  }

  // Future<AppResponse> getAppSettings({var url, var header}) async{
  //   try {
  //     var response = await DioManagerClass.getInstance.dioGetMethod(url: url,header: header);
  //     if( json.decode(response.toString())[ConstanceNetwork.resultKey]!= null){
  //       await SharedPref.instance.setAppSettings(json.encode(json.decode(response.toString())[ConstanceNetwork.resultKey]));
  //     }
  //     return AppResponse.fromJson(json.decode(response.toString()));
  //   } on DioException catch (ex) {
  //     var message = json.decode(ex.response.toString());
  //     Logger().e(message);
  //     return AppResponse.fromJson(message??{});
  //   }
  // }
}