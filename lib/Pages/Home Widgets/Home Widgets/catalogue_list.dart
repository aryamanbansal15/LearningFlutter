
import 'package:flutter/material.dart';
import 'package:fourth_app/Pages/view_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../Models/catalog.dart';
import 'catalogue_image.dart';

class CatalogueList extends StatelessWidget {
  const CatalogueList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogueModel.items.length,
      itemBuilder: (context, index) {
        final catalogue = CatalogueModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPage(item: catalogue))),
            child: CatalogueItem(catalogue: catalogue));  // Fix constructor call
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
          Hero(
              tag: Key(catalogue.id.toString()),
              child: CatalogueImage(imageURL: catalogue.imageURL)),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalogue.name.text.bold.make(),
              catalogue.desc.text.textStyle(context.captionStyle).bold.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mOnly(left: 16.0),
                children: [
                  "Rs.${catalogue.price}".text.bold.xl.make(),
                  ElevatedButton(onPressed: (){},

                    style: ButtonStyle(shape: MaterialStateProperty.all(
                        StadiumBorder()
                    )),
                    child: "Add to Cart".text.make(),
                  ).wh(130, 50),
                ],
              )
            ],
          ))
        ],
      ),
    ).blue100.square(200.0).roundedLg.make().py16();  // Fix VxBox syntax
  }
}