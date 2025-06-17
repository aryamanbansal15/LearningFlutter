import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Models/catalog.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mOnly(left: 16.0),
        children: [
          "Rs.${item.price}".text.bold.xl3.make(),
          ElevatedButton(onPressed: (){},
            style: ButtonStyle(shape: MaterialStateProperty.all(
                StadiumBorder()
            )),
            child: "Add to Cart".text.xl.make(),
          ).wh(200, 50),
        ],
      ).px16(),
      body: SafeArea(
        bottom: false,
        child: Column(
           children: [
            Hero(
              tag: Key(item.id.toString()),
                child: Center(child: Image.network(item.imageURL, width: 300, height: 350, fit: BoxFit.cover)).p16()),
            Expanded(child: VxArc(
              height:30.0,
              edge: VxEdge.top,
              arcType: VxArcType.convey,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 32),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 10.0,
                        ),
                        item.name.text.lg.black.bold.xl4.make(),
                        Container(
                          height: 10.0,
                        ),
                        item.desc.text.textStyle(context.captionStyle).xl.make(),
                        Container(
                          height: 10.0,
                        ),
                        item.detdesc.text.lg.color(Colors.black).make(),
                      ],
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      )
    );
  }
}
