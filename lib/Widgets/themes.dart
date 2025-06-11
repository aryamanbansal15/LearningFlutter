import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) =>
      ThemeData(
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        primarySwatch: Colors.blue,
      );
  static ThemeData darkTheme(BuildContext context)=>
      ThemeData(
        brightness: Brightness.dark,
      );
}