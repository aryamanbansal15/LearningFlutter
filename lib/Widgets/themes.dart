import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    cardColor: Colors.white,
    canvasColor: Color(0xfffdd0ff),
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    primarySwatch: Colors.blue,
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    cardColor: Colors.black,
    canvasColor: Color(0xFFFBD4FF),
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    primarySwatch: Colors.blue,
  );
}
