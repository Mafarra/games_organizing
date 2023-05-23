import 'package:flutter/material.dart';
import 'package:games_organizing/core/widgets/will_pop_scope.dart';
import '../resources/manager_assets.dart';
import '../resources/manager_color.dart';

Widget scaffoldWithBackGroundImage({
  required Widget child,
  Color backgroundColor = ManagerColors.primaryColor,
  String image = ManagerAssets.background,
}) {
  return willPopScope(
    child: Scaffold(
      backgroundColor: ManagerColors.background,
      body: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            image: const DecorationImage(
                image: AssetImage(
                  ManagerAssets.background,
                ),
                fit: BoxFit.cover)),
        child: child,
      ),
    ),
  );
}
