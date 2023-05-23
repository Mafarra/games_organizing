import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/manager_color.dart';

class OutBordingView extends StatelessWidget {
  const OutBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.background,
      appBar: AppBar(),
      body:const Center(
        child:  Text('OutBordingView'),
      ),
    );
  }
 }
