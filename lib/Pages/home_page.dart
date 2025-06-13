import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:fourth_app/Models/catalog.dart';
import '../Widgets/drawer.dart';
import '../Widgets/item_widget.dart';

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

  loadData() async
  {
   final catalogueJson = await rootBundle.loadString("assets/files/catalogue.json");
   final decodedData = jsonDecode(catalogueJson);
   var productData = decodedData["products"];
   CatalogueModel.items = List.from(productData).map<Item>((item)=>Item.fromMap(item)).toList();
   setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue App"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal:  16.0),
        child: ListView.builder(
            itemCount: CatalogueModel.items.length,
            itemBuilder: (context, index)
            {
              return ItemWidget(item: CatalogueModel.items[index],);
            }
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
