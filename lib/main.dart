import 'package:flutter/material.dart';
import 'package:fourth_app/Pages/login_page.dart';
import 'Pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /* home: HomePage(),*/
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(), // Run By Default
        "/home": (context) => HomePage(),
      },
    );
  }
}
