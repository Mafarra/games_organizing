import 'package:flutter/material.dart';
import '../resources/manager_assets.dart';
import '../resources/manager_color.dart';
import '../resources/manager_styles.dart';
import '../resources/managers_size.dart';

class UserInfoWidget extends StatelessWidget {
  bool? isSettingsView = false;
  UserInfoWidget({super.key, this.isSettingsView});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //profile avatar
        isSettingsView == true
            ? Container(
                margin: const EdgeInsetsDirectional.only(end: 20),
                height: ManagerHeight.h90,
                width: ManagerWidth.w90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(ManagerAssets.profileAvatar),
                    fit: BoxFit.cover,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: const Alignment(-1.8, 1.2),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.all(11.1),
                      child: Container(
                        height: ManagerHeight.h24,
                        width: ManagerHeight.h24,
                        decoration: BoxDecoration(
                          color: ManagerColors.primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        child: Icon(
                          Icons.edit,
                          color: ManagerColors.white,
                          size: ManagerIconSize.s12,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsetsDirectional.only(end: 10),
                width: ManagerWidth.w58,
                height: ManagerHeight.h58,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.red,
                    width: 1.0,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(ManagerAssets.profileAvatar),
                ),
              ),
        //user info
        Container(
          margin: isSettingsView == false
              ? EdgeInsetsDirectional.only(
                  top: ManagerHeight.h18,
                )
              : const EdgeInsetsDirectional.only(
                  top: 0.0,
                ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'أحمد عبد العزيز محمد',
                style: getMediumTextStyle(fontSize: 14, color: Colors.black),
              ),
              Text(
                'Example@gmail.com',
                style: getRegularTextStyle(
                    fontSize: 12, color: ManagerColors.grey),
              ),
              Text(
                'ID:85236',
                style: getRegularTextStyle(
                    fontSize: 12, color: ManagerColors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }
}
