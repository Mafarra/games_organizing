// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import 'package:games_organizing/features/coffe_details/presenation/View/widgets/coffee_tables_list.dart';
import 'package:get/get.dart';
import 'package:games_organizing/core/resources/manager_strings.dart';
import 'package:games_organizing/core/resources/managers_size.dart';
import 'package:games_organizing/features/near_coffee/domain/coffee_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/manager_fonts.dart';
import '../../../../core/resources/manager_styles.dart';
import '../../../../core/widgets/main_button.dart';
import '../../../settings/presentation/view/widget/custom_list_tile.dart';
import '../controller/coffee_details_controller.dart';

class CoffeDetailsView extends StatelessWidget {
  late CoffeeModel? coffeeModel;
  CoffeDetailsView({
    Key? key,
    this.coffeeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ManagerColors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                size: ManagerIconSize.s20,
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: ManagerWidth.w16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ManagerColors.greyWhite,
                      borderRadius: BorderRadius.circular(ManagerRadius.r8)),
                  child: CustomListTile(
                    isForTitle: true,
                    title: ManagerStrings.availableSeats,
                    trailing: FittedBox(
                      child: Container(
                        height: ManagerHeight.h32,
                        width: ManagerWidth.w32,
                        decoration: const BoxDecoration(
                          color: ManagerColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            coffeeModel!.availableSeats.onNull().toString(),
                            style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s10,
                              color: ManagerColors.white,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    leading: Container(
                      width: ManagerWidth.w42,
                      height: ManagerHeight.h40,
                      decoration: BoxDecoration(
                        color: ManagerColors.white,
                        borderRadius: BorderRadius.circular(ManagerRadius.r8),
                      ),
                      child: Icon(Icons.event_seat,
                          color: ManagerColors.primaryColor,
                          size: ManagerIconSize.s26),
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ManagerStrings.availableTables,
                      style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.black,
                      ),
                    ),
                    Text(
                      '(${coffeeModel!.availavleTablesCount.onNull()})',
                      style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h14,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: SizedBox(
                    height: ManagerHeight.h200,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        coffeeModel!.availavleTablesCount.onNull(),
                        (index) {
                          return CoffeeTablesList(
                            coffeeModel: coffeeModel,
                            index: index,
                            // onPressed: , this will be done using api controller
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h24,
                ),
                Container(
                  width: double.infinity,
                  height: ManagerHeight.h85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: ManagerWidth.w90,
                          height: ManagerHeight.h76,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(coffeeModel!.image.onNull()),
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r8),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ManagerWidth.w12,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  coffeeModel!.coffeeName.onNull(),
                                  style: getMediumTextStyle(
                                      fontSize: ManagerFontSize.s14,
                                      color: ManagerColors.black),
                                  textAlign: TextAlign.start,
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
                                    borderRadius: BorderRadius.circular(
                                        ManagerRadius.r30),
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
                            Row(
                              children: [
                                Text(
                                  ManagerStrings.workTime,
                                  style: getRegularTextStyle(
                                      fontSize: ManagerFontSize.s12,
                                      color: ManagerColors.grey),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(),
                              ],
                            ),
                            Row(
                              children: [
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
                                      ManagerStrings.seatPrice,
                                      style: getRegularTextStyle(
                                          fontSize: ManagerFontSize.s12,
                                          color: ManagerColors.grey),
                                    ),
                                    SizedBox(
                                      width: ManagerWidth.w8,
                                    ),
                                    Text(
                                      "${coffeeModel!.price.onNull()} ${ManagerStrings.real}",
                                      style: getRegularTextStyle(
                                          fontSize: ManagerFontSize.s12,
                                          color: ManagerColors.primaryColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ManagerHeight.h12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffeeModel!.coffeeName.onNull(),
                          style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s12,
                              color: ManagerColors.black),
                          textAlign: TextAlign.start,
                          softWrap: true,
                        ),
                        SizedBox(
                          width: ManagerWidth.w316,
                          child: Text(
                            coffeeModel!.coffeeDescription.onNull(),
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s12,
                                color: ManagerColors.grey),
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: ManagerHeight.h16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    ManagerStrings.coffeePosittion,
                    style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s12,
                        color: ManagerColors.black),
                    textAlign: TextAlign.start,
                    softWrap: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.place,
                          color: ManagerColors.primaryColor,
                          size: ManagerIconSize.s16,
                        ),
                        SizedBox(
                          width: ManagerWidth.w2,
                        ),
                        Text(
                          coffeeModel!.place.onNull(),
                          style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s12,
                              color: ManagerColors.grey),
                          textAlign: TextAlign.start,
                          softWrap: true,
                        ),
                      ],
                    ),
                    Text(
                      '${ManagerStrings.awayFromYou}  ${coffeeModel!.distance}م',
                      style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s12,
                          color: ManagerColors.primaryColor),
                      textAlign: TextAlign.end,
                      softWrap: true,
                    ),
                  ],
                ),
                //here will put map and button
                GetBuilder<CoffeeDetailsController>(builder: (controller) {
                  return Container(
                    height: ManagerHeight.h132,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ManagerRadius.r8),
                    ),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: coffeeModel!.coffePlace!, //newyork
                        zoom: 15, //14.5,
                      ),
                      markers: controller.markers,
                      onMapCreated: (GoogleMapController cont) {
                        controller.mapController.complete(cont);
                        controller.update();
                      },
                    ),
                  );
                }),
                SizedBox(
                  height: ManagerHeight.h8,
                ),
                mainButton(
                  minWidth: double.infinity,
                  height: ManagerHeight.h48,
                  color: ManagerColors.primaryColor,
                  child: Text(
                    ManagerStrings.coffeeMenu,
                    style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s12,
                        color: ManagerColors.white),
                  ),
                ),
                SizedBox(
                  height: ManagerFontSize.s20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
