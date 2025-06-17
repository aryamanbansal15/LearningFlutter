import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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