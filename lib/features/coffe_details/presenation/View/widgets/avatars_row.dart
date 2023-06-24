import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import '../../../../../core/resources/manager_assets.dart';

class AvatarRow extends StatelessWidget {
  int? playersCount = 0;
  AvatarRow({
    this.playersCount,
    super.key,
  });
  final List<String> imageUrls = [
    ManagerAssets.profileAvatar,
    ManagerAssets.profileAvatar,
    ManagerAssets.profileAvatar,
    ManagerAssets.profileAvatar,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        playersCount.onNull(),
        (index) => index < playersCount!
            ? Positioned(
                right: index * 15,
                child: FittedBox(
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: NetworkImage(
                          imageUrls.elementAt(index),
                        ),
                        backgroundColor: Colors.white,
                      )),
                ),
              )
            : SizedBox.shrink(),
      ).toList(),
    );
  }
}
