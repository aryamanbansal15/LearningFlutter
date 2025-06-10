import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final String name = "Aryaman";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue App"),
      ),
      body: Center(
        child: Container(
            child: Text("Welcome to Flutter Tutorial with $name.")
        ),
      ),
      drawer: Drawer(),
    );
  }
}
