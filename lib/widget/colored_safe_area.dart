import 'package:flutter/material.dart';

class ColoredSafeArea extends StatelessWidget {
  final Color? topColor;
  final Color? bottomColor;
  final Color? color;
  final Widget child;
  final bool top;
  final bool bottom;

  const ColoredSafeArea(
      {Key? key,
      this.topColor,
      this.bottomColor,
      required this.child,
      this.color,
      this.top = true,
      this.bottom = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: bottomColor ?? Colors.white,
      child: SafeArea(
        top: top,
        bottom: bottom,
        child: ColoredBox(
          color: topColor ?? Colors.white,
          child: SafeArea(
            top: top,
            bottom: bottom,
            child: ColoredBox(
              color: color ?? Colors.white,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
