import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/manager_color.dart';

class ManagerShadows {

 static List<BoxShadow>? mainBoxShadow = [
    BoxShadow(
      color: ManagerColors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(0, 1), // changes the position of the shadow
    ),
  ];
}
