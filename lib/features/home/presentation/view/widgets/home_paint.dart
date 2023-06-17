import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import '../../../../../core/resources/manager_color.dart';

//Add this CustomPaint widget to the Widget Tree
dynamic homePaint({double? width,Widget? child}) {
  return CustomPaint(
    size: Size(
        width.onNull(),
        (width.onNull() * 0.652672)
            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
    painter: RPSCustomPainter(
    ),
    child: child.onNull(),
  );
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.9478983);
    path_0.cubicTo(
        size.width,
        size.height * 0.9478983,
        size.width * 0.9835920,
        size.height * 1.028629,
        size.width * 0.7968427,
        size.height * 0.9891033);
    path_0.cubicTo(
        size.width * 0.6100933,
        size.height * 0.9495775,
        size.width * 0.4196960,
        size.height * 0.8388450,
        size.width * 0.2204853,
        size.height * 0.8285326);
    path_0.cubicTo(size.width * 0.02127467, size.height * 0.8182201, 0,
        size.height * 0.9478983, 0, size.height * 0.9478983);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = ManagerColors.primaryColor.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
