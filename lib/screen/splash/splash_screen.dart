import 'package:flutter/material.dart';
import 'local_widgets/blue_painter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
