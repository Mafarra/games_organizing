import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/managers_size.dart';

class MainController extends GetxController {
  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  Color color = ManagerColors.black;
  List<Widget> screens = [
    // HomeView(),
    Container(color: Colors.green,),
    Container(color: Colors.yellowAccent,),
    Container(color: Colors.blue,),
    // CategoryView(),
    // AppointmentView(),
    // ProfileView()
  ];

  List<PersistentBottomNavBarItem> bottomNavBarItems = [
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerAssets.home,
        ),
      ),
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
      iconSize: ManagerRadius.r26,
    ),
    
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerAssets.challenges,
        ),
      ),
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
      iconSize: ManagerRadius.r26,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.settings,color: ManagerColors.grey,size:ManagerIconSize.s26,),
      iconSize: ManagerIconSize.s26,
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
    ),
  ];
}
