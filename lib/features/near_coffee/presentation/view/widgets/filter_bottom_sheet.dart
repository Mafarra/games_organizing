import 'package:flutter/material.dart';
import 'package:games_organizing/core/widgets/main_button.dart';
import 'package:games_organizing/features/near_coffee/presentation/view/widgets/price_slider.dart';
import 'package:games_organizing/features/near_coffee/presentation/view/widgets/sort_filter_box.dart';
import 'package:get/get.dart';
import '../../../../../config/constants.dart';
import '../../../../../core/resources/manager_color.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../../core/resources/managers_size.dart';
import '../../controller/near_coffees_controller.dart';

displayEvaluationBottomSheet(
  BuildContext context,
  NearCoffeeController controller,
) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: ManagerWidth.w16,
              ),
              height: Constants.deviceHeight / 1.7,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      width: ManagerWidth.w34,
                      child: const Divider(
                        color: ManagerColors.black,
                        thickness: 2,
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: ManagerColors.black,
                            size: ManagerIconSize.s26,
                          ),
                        ),
                        Center(
                          child: Text(
                            ManagerStrings.filter,
                            style: getMediumTextStyle(
                                fontSize: ManagerFontSize.s16,
                                color: ManagerColors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: ManagerWidth.w42,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ManagerWidth.w26,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        ManagerStrings.availablePrice,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    PriceSlider(
                      min: 5,
                      max: 100,
                      devistion: 19,
                      rangeValues: controller.selectedPriceRange,
                      activeColor: ManagerColors.primaryColor,
                      inactiveColor: Colors.black,
                      thumbColor: Colors.white60,
                      textColor: Colors.white60,
                      onChanged: (newValues) {
                        setState(() {
                          final start = (newValues.start / 5).round() * 5;
                          final end = (newValues.end / 5).round() * 5;
                          controller.updateSliderValue(
                              RangeValues(start.toDouble(), end.toDouble()));
                        });
                      },
                    ),
                    const Divider(
                      thickness: 1,
                      color: ManagerColors.greyWhite,
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        ManagerStrings.arrangeBy,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    RoundedContainerSelection(),
                    SizedBox(
                      height: ManagerHeight.h34,
                    ),
                    mainButton(
                      minWidth: double.infinity,
                      height: ManagerHeight.h48,
                      color: ManagerColors.primaryColor,
                      child: Text(
                        ManagerStrings.applyFilter,
                        style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s12,
                            color: ManagerColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      });
}
