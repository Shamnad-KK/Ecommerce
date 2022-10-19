import 'package:flutter/animation.dart';

class Product {
  String name;
  double price;
  String image;
  String description;
  String rating;
  String reviews;
  bool isFavorite;
  int quantity;
  List<dynamic>? sizes;
  List<Color>? colors;
  dynamic selectedSize;
  Color selectedColor;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.isFavorite,
    this.sizes,
    required this.quantity,
    required this.selectedSize,
    this.colors,
    required this.selectedColor,
  });
}
