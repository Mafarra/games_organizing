import 'package:games_organizing/features/settings/data/settings_model.dart';
import 'package:logger/logger.dart';

import '../../../config/constants_network.dart';
import '../../../core/dio_manager/app_response.dart';

class SettingsFeature {
  SettingsFeature._();
  static final SettingsFeature getInstance = SettingsFeature._();
  factory SettingsFeature() => getInstance;

    Future<AppResponse> logoutUser() async {
    var appResponse = await SettingsModel.getInstance.logoutUserRequest(
        url: ConstanceNetwork.logout, header: ConstanceNetwork.header(0));
    if (appResponse.status == true) {
      Logger().d("if ${appResponse.toJson()}");
      return appResponse;
    } else {
      // snackError("",appResponse.message);
      Logger().d("else ${appResponse.toJson()}");
      return appResponse;
    }
  }
}
