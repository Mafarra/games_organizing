import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../../core/dio_manager/app_response.dart';
import '../../../core/dio_manager/dio_manage_class.dart';

class SettingsModel {
  SettingsModel._();
  static final SettingsModel getInstance = SettingsModel._();
  factory SettingsModel() => getInstance;

  Future<AppResponse> logoutUserRequest({var url, var header, var body}) async {
    try {
      var response = await DioManagerClass.getInstance
          .dioGetMethod(url: url, header: header);
      return AppResponse.fromJson(json.decode(response.toString()));
    } on DioException catch (ex) {
      var message = json.decode(ex.response.toString());
      Logger().e(message);
      return AppResponse.fromJson(message ?? {});
    }
  }
}
