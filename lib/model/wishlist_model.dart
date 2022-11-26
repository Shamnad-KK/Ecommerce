class WishlistProductElement {
  WishlistProductElement({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.size,
    required this.colors,
    required this.inventory,
    required this.description,
    required this.offer,
    required this.ratings,
  });

  String id;
  String name;
  Category category;
  int price;
  List<dynamic> size;
  List<Color> colors;
  int inventory;
  String description;
  int offer;
  List<dynamic> ratings;

  factory WishlistProductElement.fromJson(Map<String, dynamic> json) =>
      WishlistProductElement(
        id: json["_id"],
        name: json["name"],
        category: Category.fromJson(json["category"]),
        price: json["price"],
        size: (json["size"] as List).map((e) => e).toList(),
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
        inventory: json["inventory"],
        description: json["description"],
        offer: json["offer"],
        ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
      );
}

class Category {
  Category({
    required this.id,
  });

  String id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
      );
}

class Color {
  Color({
    required this.color,
    required this.images,
    required this.id,
  });

  String color;
  List<String> images;
  String id;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        color: json["color"],
        images: List<String>.from(json["images"].map((x) => x)),
        id: json["_id"],
      );
}
