import 'package:flutter/material.dart';
import 'package:fourth_app/Pages/cart.dart';
import 'package:fourth_app/Pages/login_page.dart';
import 'package:fourth_app/Widgets/themes.dart';
import 'package:fourth_app/utils/routes.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
