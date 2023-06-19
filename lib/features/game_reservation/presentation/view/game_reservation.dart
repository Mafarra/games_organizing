import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import 'package:games_organizing/core/resources/manager_fonts.dart';
import 'package:games_organizing/core/resources/manager_strings.dart';
import 'package:games_organizing/core/resources/manager_styles.dart';
import 'package:games_organizing/core/resources/managers_size.dart';
import 'package:games_organizing/features/game_reservation/domain/game_model.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/widgets/base_text_form_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../../domain/coffee_model.dart';
import '../controller/game_reservation_controller.dart';

class GameReservation extends StatelessWidget {
  final GameModel? gameModel;
  const GameReservation({super.key, this.gameModel});
//TODO: need to fix open close button in search result card
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            ManagerStrings.gameCoffees + (gameModel?.name ?? ""),
            style: getMediumTextStyle(
                fontSize: ManagerFontSize.s16, color: ManagerColors.black),
          ),
          leading: IconButton(
              onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
        ),
        body: Container(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: ManagerWidth.w16, vertical: ManagerHeight.h10),
          child: GetBuilder<GameReservationController>(
              init: GameReservationController(),
              builder: (controller) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: ManagerRadius.r12,
                          backgroundImage:
                              const NetworkImage(ManagerAssets.profileAvatar),
                        ),
                        Text(
                          ManagerStrings.hello,
                          style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                        Text(
                          "أحمد عبد العزيز", // this will changed to userName.
                          style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                          vertical: ManagerHeight.h6,
                          horizontal: ManagerWidth.w16),
                      child: Text(
                        ManagerStrings.currentPosstion,
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: ManagerColors.primaryColor,
                          size: ManagerIconSize.s20,
                        ),
                        SizedBox(
                          width: ManagerWidth.w10,
                        ),
                        Text(
                          'جدة, حي الحرية, شارع الإستقلال', //this parameter will be changed belongs to user data model
                          style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s12,
                            color: ManagerColors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ManagerHeight.h10,
                    ),
                    //search row textField and filter button
                    FittedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            width: ManagerWidth.w284,
                            child: baseTextFormField(
                              controller: controller.search,
                              hintText: ManagerStrings.searchTextFieldHint,
                              keyboardType: TextInputType.text,
                              outlineInputBorder: ManagerColors.grey,
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  size: ManagerFontSize.s20,
                                  color: ManagerColors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ManagerWidth.w10,
                          ),
                          mainButton(
                            color: ManagerColors.primaryColor,
                            height: ManagerHeight.h48,
                            minWidth: ManagerWidth.w48,
                            elevation: 0.1,
                            shapeBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              Icons.filter_list,
                              size: ManagerIconSize.s26,
                              color: ManagerColors.white,
                            ),
                            onPressed: () {
                              //show filter
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h26,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding:
                            EdgeInsets.symmetric(vertical: ManagerHeight.h8),
                        itemCount: controller.coffees.length,
                        itemBuilder: (context, index) {
                          return SearchCoffeeResultWidget(
                            coffeeModel: controller.coffees[index],
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

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
                  padding: EdgeInsetsDirectional.symmetric(
                      vertical: ManagerHeight.h8, horizontal: ManagerWidth.w8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        coffeeModel!.coffeeName.onNull(),
                        style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black),
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
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                            SizedBox(
                              width: ManagerWidth.w80,
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
