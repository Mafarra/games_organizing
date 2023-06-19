
import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import '../../../../../core/resources/manager_color.dart';
import '../../../../../core/resources/manager_fonts.dart';
import '../../../../../core/resources/manager_styles.dart';
import '../../../../../core/resources/managers_size.dart';

class GameCard extends StatelessWidget {
  final String? gameName;
  final String? gameImage;
  const GameCard({super.key, required this.gameName, required this.gameImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(ManagerRadius.r16),
            child: Image.network(
              gameImage.onNull(),
              fit: BoxFit.cover,
              width: double.infinity,
              height: ManagerHeight.h144,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w20, vertical: ManagerHeight.h4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ManagerRadius.r16),
                  bottomRight: Radius.circular(ManagerRadius.r16),
                ),
              ),
              child: Text(
                gameName.onNull(),
                style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s14, color: ManagerColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
