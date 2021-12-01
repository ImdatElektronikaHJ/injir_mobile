import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDarkTheme {
  static final ThemeData theme = ThemeData(
      appBarTheme: _appBarTheme,
      brightness: Brightness.dark,
      fontFamily: 'Avenir',
      textTheme: _textTheme,
      primarySwatch: Colors.amber,
      backgroundColor: Colors.black);

  static const AppBarTheme _appBarTheme = AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      color: Colors.transparent);

  static const TextTheme _textTheme = TextTheme(
    button: TextStyle(color: Colors.black),
  );
}
