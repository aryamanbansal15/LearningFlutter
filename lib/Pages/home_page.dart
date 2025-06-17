import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:fourth_app/Models/catalog.dart';
import 'package:fourth_app/utils/routes.dart';
import '../Widgets/drawer.dart';
import '../Widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Home Widgets/Home Widgets/catalogue_header.dart';
import 'Home Widgets/Home Widgets/catalogue_list.dart';
import 'Home Widgets/catalogue_header.dart';
import 'Home Widgets/catalogue_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    final catalogueJson = await rootBundle.loadString("assets/files/catalogue.json");
    final decodedData = jsonDecode(catalogueJson);
    var productData = decodedData["products"];
    CatalogueModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: Colors.deepPurple,
      child: Icon(CupertinoIcons.cart, size: 35),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogueHeader(),
              if (CatalogueModel.items.isNotEmpty)
              // Wrap ListView.builder with Expanded
                Expanded(child: CatalogueList().py16())
              else
                (Expanded(
                  child: Center(
                      child: CircularProgressIndicator().py16(),
                  )
                ))
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}







