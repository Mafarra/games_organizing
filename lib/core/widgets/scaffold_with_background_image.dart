import 'package:flutter/material.dart';
import 'package:games_organizing/core/widgets/will_pop_scope.dart';
import '../resources/manager_assets.dart';
import '../resources/manager_color.dart';

Widget scaffoldWithBackGroundImage({
  required Widget child,
  Color backgroundColor = ManagerColors.primaryColor,
  String? image,
}) {
  return willPopScope(
    child: Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            image:  DecorationImage(
                image: AssetImage(
                 image?? ManagerAssets.background,
                ),
                fit: BoxFit.cover)),
        child: child,
      ),
    ),
  );
}
