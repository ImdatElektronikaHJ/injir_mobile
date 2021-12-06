import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';

class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = AppColors.lightBlueColor;
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();

    ovalPath.moveTo(0, 0);

    ovalPath.quadraticBezierTo(0, 0, 0, height * 0.75);

    ovalPath.quadraticBezierTo(
        size.width / 0.5, size.height / 7, size.width, size.height / 25);
  
    ovalPath.lineTo(size.width, 0);

    paint.color = AppColors.darkBlueColor;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
