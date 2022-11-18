class Products {
  Products({
    required this.products,
    required this.count,
  });

  List<ProductElement> products;
  int count;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: (json["products"] as List)
            .map((x) => ProductElement.fromJson(x))
            .toList(),
        count: json["count"],
      );
}

class ProductElement {
  ProductElement({
    required this.category,
    required this.id,
    required this.name,
    required this.price,
    required this.size,
    required this.colors,
    required this.inventory,
    required this.description,
    required this.offer,
    required this.ratings,
  });

  Category? category;
  String? id;
  String? name;
  num? price;
  List<dynamic>? size;
  List<ProductColor>? colors;
  int? inventory;
  String? description;
  int? offer;
  List<dynamic>? ratings;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        category: Category.fromJson(json["category"]),
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        size: List<dynamic>.from(json["size"].map((x) => x)),
        colors: List<ProductColor>.from(
            json["colors"].map((x) => ProductColor.fromJson(x))),
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

  Id? id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: Id.fromJson(json["id"]),
      );
}

class Id {
  Id({
    required this.id,
    required this.category,
    required this.icon,
    required this.idId,
    required this.subCategories,
  });

  String? id;
  String? category;
  String? icon;
  int? idId;
  List<SubCategory>? subCategories;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        id: json["_id"],
        category: json["category"],
        icon: json["icon"],
        idId: json["id"],
        subCategories: List<SubCategory>.from(
            json["subCategories"].map((x) => SubCategory.fromJson(x))),
      );
}

class SubCategory {
  SubCategory({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        name: json["name"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "_id": id,
      };
}

class ProductColor {
  ProductColor({
    required this.color,
    required this.images,
    required this.id,
  });

  String color;
  List<String> images;
  String id;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        color: json["color"],
        images: List<String>.from(json["images"].map((x) => x)),
        id: json["_id"],
      );
}
