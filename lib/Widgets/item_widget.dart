import 'package:flutter/material.dart';
import '../Models/catalog.dart';

class ItemWidget  extends StatelessWidget {
  const ItemWidget ({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blueGrey,
      child: ListTile(
        leading: Image.network(item.imageURL, fit: BoxFit.fitHeight),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",),
      ),
    );
  }
}
