class Product {
  String name;
  int price;
  String image;
  String description;
  String rating;
  String reviews;
  bool isFavorite;
  List<int> sizes;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.isFavorite,
    required this.sizes,
  });
}
