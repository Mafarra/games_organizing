import 'package:flutter/material.dart';

class GenderModel {
  String? genderType = '';
  int? id;
  String? svgPic;
  bool? isChecked;
  Color? color;
  GenderModel({
    this.genderType,
    this.id,
    this.svgPic,
    this.isChecked,
    this.color,
  });
}
