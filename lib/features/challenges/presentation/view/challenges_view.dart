import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/resources/manager_assets.dart';

class ChallengesView extends StatelessWidget {
  const ChallengesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          height: 400.0,
          width: 400.0,
          child: LottieBuilder.asset(ManagerAssets.comingSoon),
        ),
      ),
    );
  }
}
