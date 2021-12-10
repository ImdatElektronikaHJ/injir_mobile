import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';

class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    Path curvedPath = Path();
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = AppColors.darkBlueColor;
    curvedPath.moveTo(0.0, height);
    curvedPath.lineTo(width, height);
    curvedPath.lineTo(width, height * 1 / 3);
    curvedPath.quadraticBezierTo(
        width * 3 / 5, height * 3 / 5, 0.0, height * 2 / 3);
    canvas.drawPath(curvedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
