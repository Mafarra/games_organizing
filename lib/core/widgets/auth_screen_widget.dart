import 'package:flutter/material.dart';

import '../../features/auth/presentaion/view/widgets/custom_paint_child.dart';
import '../../features/auth/presentaion/view/widgets/login_custom_paint.dart';
import '../resources/managers_size.dart';

// ignore: must_be_immutable
class AuthScreenWidget extends StatelessWidget {
  Widget? child;
  AuthScreenWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: loginPaint(width: width, child: loginPaintChild),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w16, vertical: ManagerHeight.h24),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
