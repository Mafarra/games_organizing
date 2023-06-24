import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';

// ignore: must_be_immutable
class PriceSlider extends StatelessWidget {
  RangeValues rangeValues;
  Color thumbColor;
  Color activeColor;
  Color inactiveColor;
  Color textColor;
  Function(RangeValues)? onChanged;
  final String? label;
  final double? min, max;
  int? devistion;

  PriceSlider({
    Key? key,
    required this.rangeValues,
    required this.thumbColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.textColor,
    this.onChanged,
    this.label,
    this.min,
    this.max,
    this.devistion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        valueIndicatorColor: Colors.blueGrey,
        thumbColor: thumbColor,
      ),
      child: RangeSlider(
        values: rangeValues,
        min: min.onNull(),
        max: max.onNull(),
        divisions: devistion.onNull(),
        onChanged: onChanged,
        activeColor: activeColor.onNull(),
        inactiveColor: inactiveColor.onNull(),
        labels: RangeLabels(
          rangeValues.start.round().toString(),
          rangeValues.end.round().toString(),
        ),
      ),
    );
  }
}
