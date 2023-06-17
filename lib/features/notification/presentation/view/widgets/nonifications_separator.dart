
import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';

import '../../../../../core/resources/manager_color.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../../core/resources/managers_size.dart';
import '../../../Domain/Model/notification_item_model.dart';

class NotificationsSeparator extends StatelessWidget {
  const NotificationsSeparator({
    super.key,
    required this.notification,
  });
  final NotificationItem notification;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: ManagerWidth.w16),
            width: ManagerWidth.w136,
            child: const Divider(
              thickness: 0.5,
              color: Color.fromRGBO(180, 184, 189, 1),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w4,
                vertical: ManagerHeight.h12),
            child: Text(
              notification.daySent.onNull(),
              style: getRegularTextStyle(
                  fontSize: ManagerFontSize.s12,
                  color: ManagerColors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: ManagerWidth.w16),
            width: ManagerWidth.w136,
            child: const Divider(
              thickness: 0.5,
              color: ManagerColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
