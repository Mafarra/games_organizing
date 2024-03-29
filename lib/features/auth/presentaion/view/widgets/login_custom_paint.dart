import 'package:flutter/material.dart';
import 'package:games_organizing/core/extensions/extensions.dart';
import '../../../../../core/resources/manager_color.dart';

//Add this CustomPaint widget to the Widget Tree
dynamic loginPaint({double? width, Widget? child}) {
  return CustomPaint(
    size: Size(
        width.onNull(),
        (width.onNull() * 0.8133333333333334)
            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
    painter: RPSCustomPainter(),
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
    path_0.lineTo(size.width, size.height);
    path_0.cubicTo(
        size.width,
        size.height,
        size.width * 0.5536667,
        size.height * 0.9176590,
        size.width * 0.3036667,
        size.height * 0.9176590);
    path_0.cubicTo(size.width * 0.05366667, size.height * 0.9176590, 0,
        size.height, 0, size.height);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = ManagerColors.primaryColor.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
