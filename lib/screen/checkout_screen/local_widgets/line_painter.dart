import 'package:flutter/widgets.dart';
import 'package:tajir/theme/app_colors.dart';
import 'package:tajir/theme/app_dimension.dart';

class LinePainter extends CustomPainter {
  late final AnimationController firstAnimation;
  late final AnimationController secondAnimation;
  late final Animation<double> _outerCircleAnimation1;
  late final Animation<double> _outerCircleAnimation2;
  late final Animation<double> _innerCircleAnimation1;
  late final Animation<double> _innerCircleAnimation2;
  late final Animation<double> _slideInAnimation1;
  late final Animation<double> _slideInAnimation2;

  LinePainter({required firstAnimation, required secondAnimation})
      : super(repaint: Listenable.merge([firstAnimation, secondAnimation])) {
    _slideInAnimation1 = CurvedAnimation(
      parent: firstAnimation,
      curve: const Interval(0.0, 0.3, curve: Curves.linear),
    );
    _outerCircleAnimation1 = CurvedAnimation(
      parent: firstAnimation,
      curve: const Interval(0.3, 0.7, curve: Curves.linear),
    );
    _innerCircleAnimation1 = CurvedAnimation(
      parent: firstAnimation,
      curve: const Interval(0.3, 1, curve: Curves.elasticOut),
    );

    _slideInAnimation2 = CurvedAnimation(
      parent: secondAnimation,
      curve: const Interval(0.0, 0.3, curve: Curves.linear),
    );
    _outerCircleAnimation2 = CurvedAnimation(
      parent: secondAnimation,
      curve: const Interval(0.3, 0.7, curve: Curves.linear),
    );
    _innerCircleAnimation2 = CurvedAnimation(
      parent: secondAnimation,
      curve: const Interval(0.3, 1, curve: Curves.elasticOut),
    );
  }
  @override
  void paint(Canvas canvas, Size size) {
    double outerCircleRadius = 22.0;
    double innerCircleRadius = 12.0;
    double padding = AppDimension.paddingMedium;

    var firstLinePath = Path();
    var innerCirclePath = Path();
    var secondLinePath = Path();
    var outerCirclePath = Path();

    var blueLinePaint = Paint()
      ..color = AppColors.blueColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    var outerCirclePaint = Paint()
      ..color = AppColors.blueColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    var greyLinePaint = Paint()
      ..color = AppColors.greyColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    var greyCirclePaint = Paint()
      ..color = AppColors.greyColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    var innerCirclePaint = Paint()
      ..color = AppColors.blueColor
      ..style = PaintingStyle.fill;

    _drawGreyLines(canvas, size, greyLinePaint, outerCircleRadius);
    _drawOuterCircles(canvas, size, greyCirclePaint, outerCircleRadius);

    firstLinePath.moveTo(outerCircleRadius * 2 + padding, size.height / 2);
    firstLinePath.lineTo(
        ((outerCircleRadius + padding) +
                (size.width / 2 - outerCircleRadius * 3 - padding) *
                    _slideInAnimation1.value) +
            outerCircleRadius,
        size.height / 2);

    innerCirclePath.addOval(Rect.fromCircle(
        center: Offset(0.0 + padding + outerCircleRadius, size.height / 2),
        radius: innerCircleRadius));
    innerCirclePath.addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: innerCircleRadius * _innerCircleAnimation1.value));
    innerCirclePath.addOval(Rect.fromCircle(
        center:
            Offset(size.width - outerCircleRadius - padding, size.height / 2),
        radius: innerCircleRadius * _innerCircleAnimation2.value));

    secondLinePath.moveTo(size.width / 2 + outerCircleRadius, size.height / 2);
    secondLinePath.lineTo(
        ((size.width / 2 + outerCircleRadius) +
            (size.width / 2 - outerCircleRadius * 3 - padding) *
                _slideInAnimation2.value),
        size.height / 2);

    firstLinePath.close();
    innerCirclePath.close();
    secondLinePath.close();

    outerCirclePath.addOval(Rect.fromCircle(
        center: Offset(padding + outerCircleRadius, size.height / 2),
        radius: outerCircleRadius));
    outerCirclePath.addArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: outerCircleRadius),
        3.14,
        3.14 * _outerCircleAnimation1.value);
    outerCirclePath.addArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: outerCircleRadius),
        -3.14,
        -3.14 * _outerCircleAnimation1.value);
    outerCirclePath.addArc(
        Rect.fromCircle(
            center: Offset(
                size.width - outerCircleRadius - padding, size.height / 2),
            radius: outerCircleRadius),
        3.14,
        3.14 * _outerCircleAnimation2.value);
    outerCirclePath.addArc(
        Rect.fromCircle(
            center: Offset(
                size.width - outerCircleRadius - padding, size.height / 2),
            radius: outerCircleRadius),
        -3.14,
        -3.14 * _outerCircleAnimation2.value);

    canvas.drawPath(outerCirclePath, outerCirclePaint);
    canvas.drawPath(innerCirclePath, innerCirclePaint);
    canvas.drawPath(firstLinePath, blueLinePaint);
    canvas.drawPath(secondLinePath, blueLinePaint);
  }

  _drawOuterCircles(
      Canvas canvas, Size size, Paint circlePaint, double outerCircleRadius) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2),
        outerCircleRadius, circlePaint);
    canvas.drawCircle(
        Offset(size.width - AppDimension.paddingMedium - outerCircleRadius,
            size.height / 2),
        outerCircleRadius,
        circlePaint);
  }

  _drawGreyLines(
      Canvas canvas, Size size, Paint greyLinePaint, double outerCircleRadius) {
    canvas.drawLine(
        Offset(
            outerCircleRadius + AppDimension.paddingMedium + outerCircleRadius,
            size.height / 2),
        Offset(size.width / 2 - outerCircleRadius, size.height / 2),
        greyLinePaint);
    canvas.drawLine(
        Offset(size.width / 2 + outerCircleRadius, size.height / 2),
        Offset(size.width - outerCircleRadius * 2 - AppDimension.paddingMedium,
            size.height / 2),
        greyLinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
