import 'package:flutter/material.dart';

import '../../../../core/resources/manager_color.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ManagerColors.background,
    );
  }
}
