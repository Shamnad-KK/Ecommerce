class CartProducts {
  CartProducts({
    required this.id,
    required this.user,
    required this.products,
  });

  String id;
  String user;
  List<CartProduct> products;

  factory CartProducts.fromJson(Map<String, dynamic> json) => CartProducts(
        id: json["_id"],
        user: json["user"],
        products: List<CartProduct>.from(
            json["products"].map((x) => CartProduct.fromJson(x))),
      );
}

class CartProduct {
  CartProduct({
    required this.product,
    required this.size,
    required this.color,
    required this.id,
  });

  ProductDetail product;
  String size;
  String color;
  String id;

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        product: ProductDetail.fromJson(json["product"]),
        size: json["size"],
        color: json["color"],
        id: json["_id"],
      );
}

class ProductDetail {
  ProductDetail({
    required this.id,
    required this.name,
    required this.price,
    required this.colors,
    required this.inventory,
    required this.offer,
    required this.description,
    required this.ratings,
  });

  String id;
  String name;
  int price;
  List<Color> colors;
  int inventory;
  int offer;
  String description;
  List<dynamic> ratings;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
        inventory: json["inventory"],
        offer: json["offer"],
        description: json["description"],
        ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
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
