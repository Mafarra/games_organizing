import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/manager_fonts.dart';
import 'package:games_organizing/core/resources/manager_strings.dart';
import 'package:games_organizing/core/resources/manager_styles.dart';
import 'package:games_organizing/features/notification/presentation/view/widgets/nonifications_separator.dart';
import 'package:games_organizing/features/notification/presentation/view/widgets/notification_widget.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_color.dart';
import '../../../../core/resources/managers_size.dart';
import '../../Domain/Model/notification_item_model.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: ' !تحدي البلوت الأسطوري',
      timeSent: '06:30م',
      description:
          'لا تنسى موعد تحدي البلوت الأسطوري اليوم في الساعة ال 09:00 مساءاً, جهز نفسك وأستعد يا بطل',
      daySent: 'اليوم',
    ),
    NotificationItem(
      title: 'Notification 2',
      timeSent: '2:30 PM',
      description: 'This is the description of Notification 2.',
      daySent: 'الأمس',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          ManagerStrings.notifications,
          style: getMediumTextStyle(
              fontSize: ManagerFontSize.s16, color: ManagerColors.black),
        ),
        backgroundColor: ManagerColors.appBarLightBackground,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Directionality(
              textDirection: TextDirection.rtl,
              child: Icon(
                Icons.arrow_back,
                color: ManagerColors.black,
                size: ManagerIconSize.s30,
              ),
            ),
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w16),
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return Column(
                children: [
                  NotificationsSeparator(notification: notification),
                  NotificationListTile(notification: notification),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
