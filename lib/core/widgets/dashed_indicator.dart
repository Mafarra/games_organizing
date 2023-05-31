import 'package:flutter/material.dart';
import 'package:games_organizing/features/out_bording/presentation/controller/out_boarding_controller.dart';
import 'package:get/get.dart';
import '../resources/managers_size.dart';

Widget dashedIndicator({
  required currentPageIndex,
  required pageCount,
}) {
  return GetBuilder<OutBoarddingController>(
      init: OutBoarddingController(),
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pageCount,
            (index) {
              return Container(
                width: index == currentPageIndex
                    ? ManagerWidth.w18
                    : ManagerWidth.w6,
                height: index == currentPageIndex
                    ? ManagerWidth.w4
                    : ManagerWidth.w6,
                margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w4),
                decoration: BoxDecoration(
                  borderRadius: controller.indicatorBorderRadius(index),
                  shape: controller.indicatorShape(index),
                  color: controller.indicatorColor(index),
                ),
              );
            },
          ),
        );
      });
}
