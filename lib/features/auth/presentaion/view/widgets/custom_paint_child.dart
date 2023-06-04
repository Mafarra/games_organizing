  import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:games_organizing/core/resources/manager_assets.dart';

import '../../../../../core/resources/managers_size.dart';

Widget loginPaintChild = Center(
    child: SafeArea(
        child: Padding(
      padding: EdgeInsets.all(ManagerWidth.w16),
      child: SvgPicture.asset(
        ManagerAssets.loginillustration,
        fit: BoxFit.cover,
        width: ManagerHeight.h200,
        height: ManagerWidth.w178,
      ),
    )),
  );