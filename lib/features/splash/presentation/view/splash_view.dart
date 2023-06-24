import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:games_organizing/core/resources/managers_size.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_color.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return scaffoldWithBackGroundImage(
    return Scaffold(
      backgroundColor: ManagerColors.primaryColor,
      body: Center(
        child: SvgPicture.asset(
          ManagerAssets.logoPackground,
          width: ManagerWidth.w302,
        ),
      ),
    );
  }
}
