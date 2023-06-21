import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import '../../../../../core/resources/manager_color.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../../core/resources/managers_size.dart';
import '../../../domain/coffee_model.dart';

class SearchCoffeeResultWidget extends StatelessWidget {
  final CoffeeModel? coffeeModel;
  const SearchCoffeeResultWidget({
    super.key,
    this.coffeeModel,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: ManagerHeight.h132,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ManagerRadius.r8),
            color: ManagerColors.greyWhite,
          ),
          child: Row(
            children: [
              SizedBox(
                width: ManagerWidth.w8,
              ),
              Container(
                width: ManagerWidth.w120,
                height: ManagerHeight.h118,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(coffeeModel!.image.onNull()),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(ManagerRadius.r8),
                ),
              ),
              SizedBox(
                width: ManagerWidth.w16,
              ),
              FittedBox(
                child: Container(
                  width: ManagerWidth.w200,
                  alignment: AlignmentDirectional.topStart,
                  padding: EdgeInsetsDirectional.only(
                      start: ManagerWidth.w12,
                      top: ManagerHeight.h4,
                      bottom: ManagerHeight.h4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          coffeeModel!.coffeeName.onNull(),
                          style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s14,
                              color: ManagerColors.black),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: ManagerHeight.h2,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.place,
                            color: ManagerColors.grey,
                            size: ManagerIconSize.s16,
                          ),
                          SizedBox(
                            width: ManagerWidth.w2,
                          ),
                          Text(
                            coffeeModel!.place.onNull(),
                            style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s12,
                              color: ManagerColors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.local_offer,
                            color: ManagerColors.grey,
                            size: ManagerIconSize.s16,
                          ),
                          SizedBox(
                            width: ManagerWidth.w8,
                          ),
                          Text(
                            "${coffeeModel!.price.onNull()} ${ManagerStrings.real}",
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s12,
                                color: ManagerColors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.near_me,
                            color: ManagerColors.grey,
                            size: ManagerIconSize.s16,
                          ),
                          SizedBox(
                            width: ManagerWidth.w8,
                          ),
                          Text(
                            coffeeModel!.distance.onNull().toString(),
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s12,
                                color: ManagerColors.grey),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.event_seat,
                                  color: ManagerColors.grey,
                                  size: ManagerIconSize.s16,
                                ),
                                SizedBox(
                                  width: ManagerWidth.w8,
                                ),
                                Text(
                                  "${coffeeModel!.availableSeats.onNull()} ${ManagerStrings.player}",
                                  style: getRegularTextStyle(
                                      fontSize: ManagerFontSize.s12,
                                      color: ManagerColors.grey),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: ManagerWidth.w64,
                            height: ManagerHeight.h26,
                            padding: EdgeInsetsDirectional.symmetric(
                                horizontal: ManagerWidth.w8),
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              color: coffeeModel!.isopen == true
                                  ? ManagerColors.green
                                  : ManagerColors.primaryColor,
                              borderRadius:
                                  BorderRadius.circular(ManagerRadius.r30),
                            ),
                            child: Center(
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: ManagerIconSize.s8,
                                      color: ManagerColors.white,
                                    ),
                                    SizedBox(
                                      width: ManagerWidth.w10,
                                    ),
                                    Text(
                                      coffeeModel!.isopen == true
                                          ? ManagerStrings.open
                                          : ManagerStrings.closed,
                                      style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s10,
                                        color: ManagerColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: ManagerHeight.h12,
        )
      ],
    );
  }
}
