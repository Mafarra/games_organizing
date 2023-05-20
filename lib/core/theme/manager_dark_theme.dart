import 'package:flutter/material.dart';

import '../resources/manager_color.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: ManagerColors.primaryColor,
  );
}
