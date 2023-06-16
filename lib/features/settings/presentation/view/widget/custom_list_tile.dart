import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import 'package:games_organizing/core/resources/managers_size.dart';
import '../../../../../core/resources/manager_color.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_styles.dart';

class CustomListTile extends StatelessWidget {
  String? title;
  String? subTitle;
  Widget? leading;
  Widget? trailing;
  ShapeBorder? shape;
  CustomListTile({
    super.key,
    this.title,
    this.subTitle,
    this.leading,
    this.trailing,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: shape,
      dense: true,
      contentPadding: EdgeInsetsDirectional.symmetric(
        horizontal: ManagerWidth.w16,
      ),
      title: Text(
        title.onNull(),
        style: getRegularTextStyle(
            fontSize: ManagerFontSize.s12, color: ManagerColors.grey),
      ),
      subtitle: Text(
        subTitle.onNull(),
        style: getMediumTextStyle(
            fontSize: ManagerFontSize.s12, color: ManagerColors.black),
      ),
      leading: leading.onNull(),
      trailing: trailing.onNull(),
    );
  }
}
