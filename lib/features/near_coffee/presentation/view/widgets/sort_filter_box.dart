import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/manager_fonts.dart';
import 'package:games_organizing/core/resources/manager_strings.dart';
import 'package:games_organizing/core/resources/manager_styles.dart';
import 'package:games_organizing/core/resources/managers_size.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/manager_color.dart';
import '../../controller/near_coffees_controller.dart';

class RoundedContainerSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NearCoffeeController>(builder: (controller) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ManagerHeight.h16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RoundedContainer(
                index: 0,
                isSelected: controller.selectedContainerIndex == 0,
                color: ManagerColors.grey,
                onTap: controller.selectContainer,
                text: ManagerStrings.mostNearme,
              ),
              SizedBox(
                width: ManagerWidth.w12,
              ),
              RoundedContainer(
                index: 1,
                isSelected: controller.selectedContainerIndex == 1,
                color: ManagerColors.grey,
                onTap: controller.selectContainer,
                text: ManagerStrings.mostReview,
              ),
            ],
          ),
          SizedBox(
            height: ManagerHeight.h10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RoundedContainer(
                index: 2,
                isSelected: controller.selectedContainerIndex == 2,
                color: ManagerColors.grey,
                onTap: controller.selectContainer,
                text: ManagerStrings.mostPerson,
              ),
              SizedBox(
                width: ManagerWidth.w12,
              ),
              RoundedContainer(
                index: 3,
                isSelected: controller.selectedContainerIndex == 3,
                color: ManagerColors.grey,
                onTap: controller.selectContainer,
                text: ManagerStrings.leastPrice,
              ),
            ],
          ),
        ],
      );
    });
  }
}

class RoundedContainer extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String? text;
  final Color color;
  final Function(int) onTap;

  const RoundedContainer({
    required this.index,
    required this.isSelected,
    this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: ManagerWidth.w108,
        height: ManagerHeight.h34,
        decoration: BoxDecoration(
          color:
              isSelected ? ManagerColors.primaryColor : ManagerColors.greyWhite,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            '$text',
            style: getRegularTextStyle(
              fontSize: ManagerFontSize.s12,
              color: isSelected ? ManagerColors.white : ManagerColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
