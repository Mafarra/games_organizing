import 'package:flutter/material.dart';

import '../resources/manager_color.dart';

ThemeData managerLightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: ManagerColors.primaryColor,
  );
}
