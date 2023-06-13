import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/manager_assets.dart';
import '../resources/manager_color.dart';
import '../resources/manager_fonts.dart';
import '../resources/manager_styles.dart';
import '../resources/managers_size.dart';

Widget welcomePageView({
  required title,
  required description,
  required photoAsset,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: ManagerWidth.w20, vertical: ManagerHeight.h10),
          height: ManagerHeight.h507,
          decoration: BoxDecoration(
              color: ManagerColors.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(ManagerRadius.r30),
                  bottomRight: Radius.circular(ManagerRadius.r30))),
          child: Center(
            child: SvgPicture.asset(
              photoAsset ?? ManagerAssets.logo,
              height: ManagerHeight.h278,
              width: ManagerWidth.w302,
            ),
          ),
        ),
      ),
      SizedBox(
        height: ManagerHeight.h10,
      ),
      Text(
        title,
        textAlign: TextAlign.center,
        style: getMediumTextStyle(
            fontSize: ManagerFontSize.s16, color: ManagerColors.textColor),
      ),
      SizedBox(
        height: 10.w,
      ),
      Center(
        child: Text(
          description,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: getRegularTextStyle(
            fontSize: ManagerFontSize.s14,
            color: ManagerColors.subTitleColor,
          ),
        ),
      ),
    ],
  );
}
