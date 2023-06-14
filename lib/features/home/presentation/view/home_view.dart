import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import 'package:games_organizing/core/resources/manager_assets.dart';
import 'package:games_organizing/core/resources/manager_fonts.dart';
import 'package:games_organizing/core/resources/manager_shadows.dart';
import 'package:games_organizing/core/resources/manager_strings.dart';
import 'package:games_organizing/core/resources/manager_styles.dart';
import 'package:games_organizing/features/home/presentation/view/widgets/home_paint.dart';

import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/managers_size.dart';
import '../../../../core/widgets/will_pop_scope.dart';
import '../../../auth/presentaion/view/widgets/custom_paint_child.dart';
import '../../../auth/presentaion/view/widgets/login_custom_paint.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return willPopScope(
      child: Scaffold(
        extendBody: true,
        // extendBodyBehindAppBar: true,
        backgroundColor: ManagerColors.greyWhite,
        body: Stack(
          children: [
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
              child: SingleChildScrollView(
                child: Column(
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
                          onPressed: () {},
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
                        borderRadius: BorderRadius.circular(ManagerRadius.r16),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: ManagerWidth.w18,
                              bottom: ManagerHeight.h26,
                            ),
                            //user info and avatar
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //profile avatar
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  margin: const EdgeInsets.only(left: 10),
                                  width: ManagerWidth.w58,
                                  height: ManagerHeight.h58,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.red,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        ManagerAssets.profileAvatar),
                                  ),
                                ),
                                //user info
                                Container(
                                  margin: EdgeInsets.only(
                                    top: ManagerHeight.h18,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'أحمد عبد العزيز محمد',
                                        style: getMediumTextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      Text(
                                        'Example@gmail.com',
                                        style: getRegularTextStyle(
                                            fontSize: 12,
                                            color: ManagerColors.grey),
                                      ),
                                      Text(
                                        'ID:85236',
                                        style: getRegularTextStyle(
                                            fontSize: 12,
                                            color: ManagerColors.grey),
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
                                    'الألعاب المحجوزة :',
                                    style: getMediumTextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                  Text(
                                    ' 3 ',
                                    style: getMediumTextStyle(
                                        fontSize: 14,
                                        color: ManagerColors.white),
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
                        'قائمة الألعاب المتوفرة',
                        style: getRegularTextStyle(
                            fontSize: 14, color: ManagerColors.black),
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.only(top: 2, bottom: 40),
                      shrinkWrap: true,
                      children: gameCards,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<GameCard> gameCards = [
  const GameCard(
    gameImage: ManagerAssets.balootGame,
    gameName: ManagerStrings.balootGame,
  ),
  const GameCard(
    gameImage: ManagerAssets.chessGame,
    gameName: ManagerStrings.chessGame,
  ),
  const GameCard(
    gameImage: ManagerAssets.balootGame,
    gameName: ManagerStrings.balootGame,
  ),
];

class GameCard extends StatelessWidget {
  final String? gameName;
  final String? gameImage;
  const GameCard({super.key, required this.gameName, required this.gameImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(ManagerRadius.r16),
            child: Image.network(
              gameImage.onNull(),
              fit: BoxFit.cover,
              width: double.infinity,
              height: ManagerHeight.h144,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w20, vertical: ManagerHeight.h4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ManagerRadius.r16),
                  bottomRight: Radius.circular(ManagerRadius.r16),
                ),
              ),
              child: Text(
                gameName.onNull(),
                style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s14, color: ManagerColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
