import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import 'package:games_organizing/core/resources/manager_assets.dart';
import 'package:games_organizing/core/resources/manager_fonts.dart';
import 'package:games_organizing/core/resources/manager_shadows.dart';
import 'package:games_organizing/core/resources/manager_strings.dart';
import 'package:games_organizing/core/resources/manager_styles.dart';
import 'package:games_organizing/features/home/presentation/view/widgets/game_card.dart';
import 'package:games_organizing/features/home/presentation/view/widgets/home_paint.dart';
import 'package:games_organizing/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/managers_size.dart';
import '../../../../core/widgets/user_info_widget.dart';
import '../../../../core/widgets/will_pop_scope.dart';
import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return willPopScope(
      child: Scaffold(
        extendBody: true,
        backgroundColor: ManagerColors.greyWhite,
        body: Stack(
          children: [
            //background stack
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                homePaint(
                  width: width,
                  child: Center(
                    child: SafeArea(
                        child: Padding(
                      padding: EdgeInsets.all(ManagerWidth.w16),
                      child: SizedBox(
                        height: ManagerHeight.h184,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ManagerHeight.h48,
                left: ManagerWidth.w16,
                right: ManagerWidth.w16,
              ),
              child: GetBuilder<HomeViewConteroller>(
                  init: HomeViewConteroller(),
                  builder: (controller) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // first Row of screen
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: ManagerWidth.w50,
                            ),
                            Text(
                              ManagerStrings.mainNav,
                              style: getMediumTextStyle(
                                  fontSize: ManagerFontSize.s16,
                                  color: ManagerColors.white),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed(Routes.notificatioView);
                              },
                              icon: Stack(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    size: ManagerIconSize.s30,
                                    color: ManagerColors.white,
                                  ),
                                  Visibility(
                                    visible:
                                        true, //TODO: this will change belongs to notifications list
                                    child: Positioned(
                                      top: 4,
                                      right: 3,
                                      child: CircleAvatar(
                                        radius: 6,
                                        backgroundColor: ManagerColors.white,
                                        child: Container(
                                          width: 8,
                                          height: 8,
                                          decoration: const BoxDecoration(
                                            color: ManagerColors.primaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // home card info
                        Container(
                          margin: EdgeInsets.only(top: ManagerHeight.h48),
                          width: ManagerWidth.w343,
                          height: ManagerHeight.h184,
                          decoration: BoxDecoration(
                            boxShadow: ManagerShadows.mainBoxShadow,
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r16),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  right: ManagerWidth.w18,
                                  bottom: ManagerHeight.h26,
                                ),
                                //user info and avatar
                                child: UserInfoWidget(
                                  isSettingsView: false,
                                ),
                              ),
                              //card of Reserved games count.
                              Center(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: ManagerWidth.w75),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ManagerWidth.w20,
                                      vertical: ManagerHeight.h8),
                                  decoration: BoxDecoration(
                                    color: ManagerColors.primaryColor,
                                    borderRadius:
                                        BorderRadius.circular(ManagerRadius.r8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ManagerStrings.reservationGames,
                                        style: getMediumTextStyle(
                                            fontSize: 12, color: Colors.white),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        ' ${controller.reservationGameCount} ',
                                        style: getMediumTextStyle(
                                            fontSize: 14,
                                            color: ManagerColors.white),
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              right: ManagerWidth.w14,
                              top: ManagerHeight.h26,
                              bottom: ManagerHeight.h14),
                          child: Text(
                            ManagerStrings.availableGameMenue,
                            style: getRegularTextStyle(
                                fontSize: 14, color: ManagerColors.black),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.only(top: 2, bottom: 40),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){},
                                child: GameCard(
                                    gameName:
                                        controller.gameCards[index].gameName,
                                    gameImage:
                                        controller.gameCards[index].gameImage),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
