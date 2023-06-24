// ignore_for_file: prefer_if_null_operators

import 'package:logger/logger.dart';

class AppResponse {
  dynamic code;
  dynamic data;
  dynamic message;
  dynamic status;
  AppResponse({this.code, this.data, this.message, this.status = false});

  factory AppResponse.fromJson(var map) {
    try {
      if(map == null || map == {}){
        return AppResponse(
            code: 0, data: null, message: "", status: false);
      }else {
        return AppResponse(
          code: map["code"] == null ? 0 : map["code"],
          data: map["data"] == null ? null : map["data"],
          message: map["Message"] == null ? "" : map["Message"],
          status: map["Status"] == null ? false : map["Status"],
        );
      }
    } catch (e) {
      return AppResponse(
          code: 0, data: null, message: "", status: false);
    }
  }

  Map<String, dynamic> toJson() {
    try {
      return {
        "code": code  == null ? null:code,
        "data": data  == null ? null:data,
        "Message": message  == null ? "":message,
        "Status": status  == null ? false:status
      };
    } catch (e) {
      Logger().e(e);
      return {"": ""};
    }
  }
}
