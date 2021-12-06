import 'package:flutter/material.dart';
import 'local_widget/splash_screen_widget.dart';

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

