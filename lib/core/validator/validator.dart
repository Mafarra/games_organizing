import 'package:get/get_utils/src/get_utils/get_utils.dart';
import '../resources/manager_strings.dart';

class FieldValidator {
  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return ManagerStrings.invalidEmail;
    }
    //just for example so GetUtils.isEmail do better
    if (!RegExp(r"\S+@\S+\.\S+").hasMatch(email)) {
      return ManagerStrings.invalidEmail;
    }

    if (!GetUtils.isEmail(email)) {
      return ManagerStrings.invalidEmail;
    }
    return null;
  }
   String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return ManagerStrings.invalidPassword;
    }

    if (password.length < 8) {
      return ManagerStrings.invalidPassword;
    }
    return null;
  }
  String? validateFullName(String? password) {
    if (password!.isEmpty) {
      return ManagerStrings.invalidEntry;
    }

    if (password.length < 5) {
      return ManagerStrings.invalidEntry;
    }

    return null;
  }
    String? validateCode(value) {
    if (value == null || value.trim().isEmpty) {
      return ManagerStrings.invalidEmptyCode;
    }
    return null;
  }
}
