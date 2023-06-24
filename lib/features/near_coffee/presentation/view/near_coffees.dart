import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/manager_fonts.dart';
import 'package:games_organizing/core/resources/manager_strings.dart';
import 'package:games_organizing/core/resources/manager_styles.dart';
import 'package:games_organizing/core/resources/managers_size.dart';
import 'package:games_organizing/features/near_coffee/domain/game_model.dart';
import 'package:games_organizing/features/near_coffee/presentation/view/widgets/coffee_search_result_widget.dart';
import 'package:games_organizing/features/near_coffee/presentation/view/widgets/filter_bottom_sheet.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/widgets/base_text_form_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../coffe_details/presenation/View/coffee_details.dart';
import '../../../coffe_details/presenation/controller/coffee_details_controller.dart';
import '../controller/near_coffees_controller.dart';

class NearCoffee extends StatelessWidget {
  final GameModel? gameModel;
  const NearCoffee({super.key, this.gameModel});
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
          child: GetBuilder<NearCoffeeController>(
              init: NearCoffeeController(),
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
                                onPressed: () {
                                  //search icon button
                                },
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
                              displayEvaluationBottomSheet(context, controller);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ManagerHeight.h26,
                    ),
                    //result title text and count of results
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ManagerStrings.coffeesMenu,
                          style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.black,
                          ),
                        ),
                        Text(
                          '(${controller.searchResultCount})',
                          style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s14,
                            color: ManagerColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ManagerHeight.h8,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding:
                            EdgeInsets.symmetric(vertical: ManagerHeight.h8),
                        itemCount: controller.getCoffees().length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              CoffeeDetailsController coffeeController = Get.put(CoffeeDetailsController());
                              coffeeController.addMarkers(coffeeModel: controller.myCoffees[index]);
                              Get.to(CoffeDetailsView(
                                coffeeModel: controller.myCoffees[index],
                              ));
                            },
                            child: SearchCoffeeResultWidget(
                              coffeeModel: controller.myCoffees[index],
                            ),
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
