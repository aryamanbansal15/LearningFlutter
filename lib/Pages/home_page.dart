import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:fourth_app/Models/catalog.dart';
import 'package:fourth_app/utils/routes.dart';
import '../Widgets/drawer.dart';
import '../Widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

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
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogueHeader(),
              if (CatalogueModel.items.isNotEmpty)
              // Wrap ListView.builder with Expanded
                Expanded(child: CatalogueList())
              else
                Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogueHeader extends StatelessWidget {
  const CatalogueHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalogue App".text.center.bold.color(Colors.black).xl4.make(),
        "Trending Products".text.center.color(Colors.black).xl2.make(),
      ],
    );
  }
}

class CatalogueList extends StatelessWidget {
  const CatalogueList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogueModel.items.length,
      itemBuilder: (context, index) {
        final catalogue = CatalogueModel.items[index];
        return CatalogueItem(catalogue: catalogue);  // Fix constructor call
      },
    );
  }
}

class CatalogueItem extends StatelessWidget {
  const CatalogueItem({super.key, required this.catalogue});  // Fix constructor
  final Item catalogue;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogueImage(imageURL: catalogue.imageURL),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalogue.name.text.bold.make(),
              catalogue.desc.text.textStyle(context.captionStyle).make(),
            ],
          ))
        ],
      ),
    ).blue100.square(200.0).roundedLg.make().py16();  // Fix VxBox syntax
  }
}



class CatalogueImage extends StatelessWidget {
  const CatalogueImage({super.key, required this.imageURL});
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return
      Image.network(imageURL).box.p16.white.make().p16() ;
  }
}
