import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../resources/manager_color.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_styles.dart';
import '../resources/manager_text_theme_light.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,

    /// MAON COLORS APP
    primaryColor: ManagerColors.primaryColor,
    primaryColorLight: ManagerColors.primaryColorLight,
    
    //this for disabled button colors
    disabledColor: ManagerColors.textColor,
    splashColor: ManagerColors.greyLight,
    scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColorLight,

    //App Bar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.greyLight,
      elevation: Constants.elevationAppBar,
      titleTextStyle: getBoldTextStyle(
          fontSize: ManagerFontSize.s14, color: ManagerColors.primaryColor),
    ),

    //Button Theme
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: ManagerColors.greyLight,
      buttonColor: ManagerColors.buttonColorLight,
    ),
    inputDecorationTheme: const InputDecorationTheme(
     isDense: true,// this will remove the default content padding
     // now you can customize it here or add padding widget
     contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
  ),
    //unselectedWidgetColor
    unselectedWidgetColor: ManagerColors.greyWhite,

    textTheme: ManagerTextThemeLight(),
  );
}
