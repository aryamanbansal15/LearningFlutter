class CatalogueModel
{
  static List<Item> items = [
  ];
}


class Item
{
  final String name;
  final String id;
  final String desc;
  final num price;
  final String color;
  final String imageURL;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.imageURL});

  factory Item.fromMap(Map<String, dynamic> map)
  {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      imageURL: map["imageURL"],
    );
  }

  toMap() =>{
    "id" : id,
    "name" : name,
    "price" : price,
    "desc" : desc,
    "color" : color,
    "imageURL" : imageURL
  };
}
