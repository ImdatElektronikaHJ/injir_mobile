import 'package:flutter/material.dart';
import 'package:tajir/theme/app_colors.dart';

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BluePainter(),
        child: Center(
          child: Image.asset(
              'assets/images/tajir_logo_text.png',
            ),
        ),
      ),
    );
  }
}

class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = AppColors.darkBlueColor;
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    // Start paint from 20% height to the left
    ovalPath.lineTo(0, 0);

    // paint a curve from current position to middle of the screen
    ovalPath.quadraticBezierTo(
        0,  0, 0, height * 0.75);

    ovalPath.quadraticBezierTo(
        size.width / 0.5, size.height / 7, size.width, size.height / 450);
    ovalPath.lineTo(size.width, 0);

    // Paint a curve from current position to bottom left of screen at width * 0.1
   // ovalPath.quadraticBezierTo(width * 5020, height / 0.18, width * 0.1, height);

    // draw remaining line to bottom left side
    //ovalPath.lineTo(0, height);

    // Close line to reset it back
    //ovalPath.close();

    paint.color = AppColors.lightBlueColor;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}


// class MyClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height / 1.2);
//     path.quadraticBezierTo(
//         size.width / 0.5, size.height / 2.5, size.width, size.height / 3);
//     path.lineTo(size.width, 0);

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => true;
// }
