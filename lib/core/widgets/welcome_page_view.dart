import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/manager_color.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_styles.dart';

Widget welcomePageView({
  required title,
  required description,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        style: getMediumTextStyle(
            fontSize: ManagerFontSize.s16, color: ManagerColors.textColor),
      ),
      SizedBox(
        height: 10.w,
      ),
      Text(
        description,
        style: getRegularTextStyle(
            fontSize: ManagerFontSize.s14, color: ManagerColors.subTitleColor),
      ),
    ],
  );
}
