
import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/managers_size.dart';
import '../../../../../core/resources/manager_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: ManagerWidth.w16),
      child: const Divider(
        color: ManagerColors.grey,
        height: 0.5,
        thickness: 0.3,
      ),
    );
  }
}
