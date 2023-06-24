// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_if_null_operators

import 'package:logger/logger.dart';

class AppResponse {
  dynamic status;
  dynamic code;
  dynamic message;
  dynamic data;
  AppResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory AppResponse.fromJson(var map) {
    try {
      if (map == null || map == {}) {
        return AppResponse(code: 0, data: null, message: "", status: false);
      } else {
        return AppResponse(
          status: map["status"] == null ? false : map["status"],
          code: map["code"] == null ? 0 : map["code"],
          message: map["message"] == null ? "" : map["message"],
          data: map["data"] == null ? null : map["data"],
        );
      }
    } catch (e) {
      return AppResponse(code: 0, data: null, message: "", status: false);
    }
  }

  Map<String, dynamic> toJson() {
    try {
      return {
        "status": status == null ? false : status,
        "code": code == null ? null : code,
        "message": message == null ? "" : message,
        "data": data == null ? null : data,
      };
    } catch (e) {
      Logger().e(e);
      return {"": ""};
    }
  }
}
