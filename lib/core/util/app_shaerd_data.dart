import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:games_organizing/core/resources/manager_assets.dart';
import 'package:games_organizing/core/util/sh_util.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';
import '../../config/constants_network.dart';
import '../resources/manager_strings.dart';
import '../resources/managers_size.dart';
import '../service/localization/localization_service.dart';

String? urlPlacholder =
    "https://user-images.githubusercontent.com/194400/49531010-48dad180-f8b1-11e8-8d89-1e61320e1d82.png";
String? urlUserPlacholder =
    "https://jenalk.ahdtech.com/dev/assets/img/no-user.png";

// var hideStatusBar =
//     SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
// var hideBottomBar =
//     SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
// var hideAllBar = SystemChrome.setEnabledSystemUIOverlays([]);

void portraitOrientation() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}

String getDeviceLang() {
  Locale myLocale = Localizations.localeOf(Get.context!);
  String languageCode = myLocale.languageCode;
  return languageCode;
}

snackSuccess(String? title, String? body) {
  mainSnack(
      body: body ?? "",
      backgroundColor: const Color(0xFF10C995).withAlpha(150));
}

snackError(String? title, String? body) {
  mainSnack(
      body: body ?? "",
      backgroundColor: const Color(0xFFF2AE56).withAlpha(150));
}

snackConnection() {
  mainSnack(
      body: ManagerStrings.noInternetConnection.tr,
      backgroundColor: const Color(0xFF000000).withAlpha(150));
}

mainSnack({String? title, String? body, Color? backgroundColor}) {
  Future.delayed(const Duration(seconds: 0)).then((value) {
    try {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: backgroundColor ?? const Color(0xFF303030),
          message:
              body != null && body.trim().isNotEmpty ? body : "error occurred",
          duration: const Duration(seconds: 2),
          borderRadius: 10,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      );
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: backgroundColor ?? const Color(0xFF303030),
          message: "error occurred",
          duration: const Duration(seconds: 2),
          borderRadius: 10,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      );
    }
  });
}

showAnimatedDialog(dialog) {
  showGeneralDialog(
    barrierDismissible: false,
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    context: Get.context!,
    pageBuilder: (context, anim1, anim2) {
      return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: dialog,
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(anim1),
        child: child,
      );
    },
  );
}

Widget imageNetwork({double? width, double? height, String? url, BoxFit? fit}) {
  try {
    return CachedNetworkImage(
      imageUrl: url ?? urlUserPlacholder! /*urlUserPlacholder!*/,
      errorWidget: (context, url, error) {
        return CachedNetworkImage(
            width: width,
            height: height,
            imageUrl: urlUserPlacholder!,
            fit: BoxFit.contain);
      },
      width: width ?? 74,
      height: height ?? 74,
      fit: BoxFit.cover,
      placeholder: (context, String? url) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ManagerAssets.loadingShimmer),
              fit: BoxFit.cover,
            ),
          ),
          child:  Center(
            child: SizedBox(
                width: ManagerWidth.w20,
                height: ManagerHeight.h20,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                )),
          ),
        );
      },
    );
  } on Exception catch (e) {
    // TODO

    return CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: urlUserPlacholder!,
        fit: BoxFit.contain);
  }
}

hideFocus(context) {
  FocusScopeNode currentFocus = FocusScope.of(context ?? Get.context!);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    currentFocus.focusedChild!.unfocus();
    FocusManager.instance.primaryFocus!.unfocus();
  }
}

DateTime convertStringToDate(DateTime? date) {
  Logger().d("date befor ${date.toString()}");
  var stringDate = date.toString();
  Logger().d("date after $stringDate");
  return DateFormat("yyyy-MM-dd").parse(stringDate);
}

compareToTime(TimeOfDay oneVal, TimeOfDay twoVal) {
  var format = DateFormat("HH:mm a");
  var one = format.parse(oneVal.format(Get.context!));
  var two = format.parse(twoVal.format(Get.context!));
  return one.isBefore(two);
}

double convertStringToDouble(String value) {
  return double.tryParse(value)!.toDouble();
}

updateLanguage(Locale locale) {
  Get.updateLocale(locale);
}

class CustomMaterialPageRoute extends MaterialPageRoute {
  @protected
  bool get hasScopedWillPopCallback {
    return false;
  }

  CustomMaterialPageRoute({
    @required WidgetBuilder? builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder!,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );
}

class DismissKeyboard extends StatelessWidget {
  final Widget? child;

  DismissKeyboard({this.child});

  @override
  Widget build(BuildContext context) {
    // screenUtil(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}

bool isArabicLang() {
  return (SharedPref.instance.getAppLanguageMain() ==
          LocalizationService.localeAr
      ? true
      : false);
}

Future<DateTime?> dateBiker() async {
  Locale myLocale = Localizations.localeOf(Get.context!);
  var picker = await showDatePicker(
    context: Get.context!,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
    locale: myLocale,
  );
  return picker;
}

Future<TimeOfDay?> timeBiker() async {
  var picker = await showTimePicker(
    context: Get.context!,
    helpText: ManagerStrings.txtReturnTime.tr,
    initialTime: TimeOfDay(
        hour: DateTime.now().hour,
        minute: DateTime.now().minute % 30 == 0 ? 0 : 30),
  );
  return picker;
}

String formatStringWithCurrency(var data /*, String currency*/) {
  try {
    var number = data.toString().replaceAll("\$", "").replaceAll(",", "");
    number =
        "\$ ${NumberFormat("#0.00", "en_US").format(double.parse(number))}";
    //var numbers = "${currency}${double.parse(number).toStringAsFixed(2)}";
    return number.toString();
  } catch (e) {
    print(e);
    return "0.00";
  }
}


bool isUser() {
  return SharedPref.instance.getIsUserKey();
}

loginUserAgain() {
  var userName = SharedPref.instance.getUserName();
  var password = SharedPref.instance.getPassword();
  if (userName.toString().isNotEmpty && password.toString().isNotEmpty) {
    Map<String, dynamic> map = {
      ConstanceNetwork.userNameKey: userName,
      ConstanceNetwork.passwordKey: password,
      ConstanceNetwork.fcmToken: SharedPref.instance.getFCMToken().toString(),
    };
    // UserAuthFeature.getInstance.loginUser(map);
  } else {
    Map<String, dynamic> map = {
      // ConstanceNetwork.socialIdKey: SharedPref.instance.getIdSocial(),
      ConstanceNetwork.fcmToken: SharedPref.instance.getFCMToken().toString(),
    };
    // UserAuthFeature.getInstance.refreshLoginSocialMediaForUser(map);
  }
}
