import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../../../../core/resources/managers_size.dart';
import '../../../../core/widgets/will_pop_scope.dart';
import '../controller/main_controller.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return willPopScope(
      child: GetBuilder<MainController>(
        builder: (controller) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: PersistentTabView(
              padding: const NavBarPadding.symmetric(vertical: 3,horizontal: 5),
              context,
              controller: controller.persistentTabController,
              backgroundColor: Colors.white,
              navBarStyle: NavBarStyle.style6,
              confineInSafeArea: true,
              navBarHeight: ManagerHeight.h70,
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    ManagerRadius.r16,
                  ),
                  topRight: Radius.circular(
                    ManagerRadius.r16,
                  ),
                ),
              ),
              screens: controller.screens,
              items: controller.bottomNavBarItems,
            ),
          );
        },
      ),
    );
  }
}
