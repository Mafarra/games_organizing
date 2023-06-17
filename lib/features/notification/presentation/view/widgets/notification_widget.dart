
import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';

import '../../../../../core/resources/manager_color.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../Domain/Model/notification_item_model.dart';

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({
    super.key,
    required this.notification,
  });

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        //TODO:  fix border if new item color will be primary
        borderRadius: BorderRadius.circular(8.0),
      ),
      tileColor: ManagerColors.greyWhite,
      title: Row(
        children: [
          Text(notification.title.onNull(),
              style: getMediumTextStyle(
                  fontSize: ManagerFontSize.s10, color: ManagerColors.black)),
          const Spacer(),
          Text(
            notification.timeSent.onNull(),
            style: getRegularTextStyle(
              fontSize: ManagerFontSize.s10,
              color: ManagerColors.black,
            ),
          ),
        ],
      ),
      subtitle: Text(
        notification.description.onNull(),
        style: getRegularTextStyle(
            fontSize: ManagerFontSize.s10, color: ManagerColors.grey),
      ),
    );
  }
}
