import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/manager_color.dart';
import '../resources/managers_size.dart';

Widget dashedIndicator({
  required currentPageIndex,
  required pageCount,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      pageCount,
      (index) {
        return Container(
          width: index == currentPageIndex ? ManagerWidth.w18 : ManagerWidth.w6,
          height: index == currentPageIndex ? ManagerWidth.w4 : ManagerWidth.w6,
          margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w4),
          decoration: BoxDecoration(
            borderRadius:
                index == currentPageIndex ? BorderRadius.circular(10) : null,
            shape: index == currentPageIndex
                ? BoxShape.rectangle
                : BoxShape.circle,
            color: index == currentPageIndex
                ? ManagerColors.activeColorIndicator
                : ManagerColors.inactiveColorIndicator,
          ),
        );
      },
    ),
  );
}
