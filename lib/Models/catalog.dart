class CatalogueModel
{
  static List<Item> items = [
    Item(
      id : "101",
      name : "Iphone 12",
      desc : "This phone is Apple's iPhone 12",
      price : 999,
      color : "#33505a",
      imageURL : "https://images.unsplash.com/photo-1607936854279-55e8a4c64888?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    )
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
