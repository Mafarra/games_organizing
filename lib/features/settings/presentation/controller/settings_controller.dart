import 'package:games_organizing/routes/routes.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../core/util/sh_util.dart';
import '../../data/settings_feature.dart';

class SettingsController extends GetxController{
bool isLoading = false;






  Future<void> logoutUser({bool? isFromGuest = false}) async {
    try {
      startLoading();
      await SettingsFeature.getInstance.logoutUser().then((value) async {
        //handle object from value || [save in sharedPreferences]
        Logger().d(value.toJson());
        if (value.status) {
          await SharedPref.instance.setUserLogin(false);
          Get.offAllNamed(Routes.loginView);
          endLoading();
          await SharedPref.instance.clear();
        } else {
          endLoading();
          await SharedPref.instance.setUserLogin(false);
          Get.offAllNamed(Routes.loginView);
          await SharedPref.instance.clear();
        }
      }).catchError((onError) {
        Logger().d(onError.toString());
        endLoading();
      });
    } catch (e) {
      Logger().d(e.toString());
      endLoading();
    }
  }



  void startLoading() {
    isLoading = true;
    update();
  }

  void endLoading() {
    isLoading = false;
    update();
  }
}