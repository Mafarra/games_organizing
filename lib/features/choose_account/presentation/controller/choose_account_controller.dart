import 'package:get/get.dart';

import '../../../../routes/routes.dart';

class ChooseAccountController extends GetxController {

  void gotoSigninScreen() => Get.offAllNamed(Routes.loginView);
  void gotoRegisterScreen() => Get.offAllNamed(Routes.registerView);

  void enterAsVisitor() {
    // save in shared pref user type is visitor
  }
}
