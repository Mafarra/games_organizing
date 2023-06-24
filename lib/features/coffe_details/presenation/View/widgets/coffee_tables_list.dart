import 'package:flutter/material.dart';
import 'package:games_organizing/features/coffe_details/presenation/View/widgets/avatars_row.dart';
import '../../../../../core/resources/manager_assets.dart';
import '../../../../../core/resources/manager_color.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_strings.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../../core/resources/managers_size.dart';
import '../../../../../core/widgets/main_button.dart';
import '../../../../near_coffee/domain/coffee_model.dart';

class CoffeeTablesList extends StatelessWidget {
  CoffeeModel? coffeeModel;
  int? index;
  Function()? onPressed;
  CoffeeTablesList({
    this.coffeeModel,
    this.index = 0,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: ManagerWidth.w12),
      padding: EdgeInsetsDirectional.symmetric(
          vertical: ManagerHeight.h6, horizontal: ManagerWidth.w12),
      width: ManagerWidth.w162,
      height: ManagerHeight.h178,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r8),
        border: Border.all(
          color: ManagerColors.black,
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: const Alignment(1, 1),
            child: CircleAvatar(
              backgroundColor: ManagerColors.greyDark,
              radius: ManagerRadius.r12,
              child: Text(
                ('0${coffeeModel!.tables!.indexOf((coffeeModel!.tables![index!])) + 1}'),
                style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s10, color: ManagerColors.white),
              ),
            ),
          ),
          SizedBox(
            height: ManagerHeight.h60,
            width: ManagerWidth.w80,
            child: Image.asset(
              ManagerAssets.tables,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ManagerStrings.reservedSeats,
                    style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.black,
                    ),
                  ),
                  Text(
                    '(${coffeeModel!.tables![index!].reservedSeatsCount.toString()})',
                    style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s14,
                      color: ManagerColors.black,
                    ),
                  ),
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      child: SizedBox(
                          height: ManagerHeight.h24,
                          child: AvatarRow(
                            playersCount:
                                coffeeModel!.tables![index!].reservedSeatsCount,
                          ))),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: mainButton(
              onPressed: onPressed,
              radius: ManagerRadius.r8,
              minWidth: double.infinity, //ManagerWidth.w120,
              height: ManagerHeight.h32,
              color: ManagerColors.primaryColor,
              child: Text(
                ManagerStrings.reserveSeat,
                style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s12, color: ManagerColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
