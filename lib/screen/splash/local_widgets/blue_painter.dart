import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';

class BluePainter extends CustomPainter {
  late final AnimationController animation;
  late final Animation<double> _slideInAnimation;

  BluePainter({
    required this.animation,
  }) : super(repaint: animation) {
    _slideInAnimation = CurvedAnimation(
      parent: animation,
      curve: const Interval(0.0, 0.7, curve: Curves.fastOutSlowIn),
    );
  }

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
    curvedPath.lineTo(
        width, height - height * (2 / 3) * _slideInAnimation.value);
    curvedPath.quadraticBezierTo(
        width * 3 / 5,
        height - height * (2 / 5) * _slideInAnimation.value,
        0.0,
        height - height * (1 / 3) * _slideInAnimation.value);
    curvedPath.close();
    canvas.drawPath(curvedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
