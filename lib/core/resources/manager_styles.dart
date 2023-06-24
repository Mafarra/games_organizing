import 'package:games_organizing/core/resources/manager_fonts.dart';
import 'package:flutter/material.dart';

TextStyle _textStyle({
  required double fontSize,
  required String fontFamily,
  required FontWeight fontweight,
  required Color color,
  required TextDecoration decoration,
}) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontweight,
      color: color,
      decoration: decoration);
}

TextStyle getRegularTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,

}) {
  return _textStyle(
      fontSize: fontSize,
      fontFamily: ManagerFontFamily.fontFamilyAr,
      fontweight: ManagerFontWeight.regular,
      color: color,
      decoration: decoration);
}

TextStyle getBoldTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _textStyle(
      fontSize: fontSize,
      fontFamily: ManagerFontFamily.fontFamilyAr,
      fontweight: ManagerFontWeight.bold,
      color: color,
      decoration: decoration);
}

TextStyle getMediumTextStyle({
  required double fontSize,
  required Color color,
  TextDecoration decoration = TextDecoration.none,
}) {
  return _textStyle(
      fontSize: fontSize,
      fontFamily: ManagerFontFamily.fontFamilyAr,
      fontweight: ManagerFontWeight.medium,
      color: color,
      decoration: decoration);
}
