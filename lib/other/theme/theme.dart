import 'package:flutter/material.dart';

class CustomTheme {
  static final darkTheme = ThemeData(
    primaryColor: darkThemeColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: black,
    useMaterial3: true,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: darkThemeColor,
        fontSize: 20,
        fontFamily: 'Imprima',
      ),
    ),
  );

  // colors
  static Color black = const Color.fromARGB(255, 34, 34, 34),
      darkThemeColor = Colors.white;
}
