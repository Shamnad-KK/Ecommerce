// import 'package:flutter/animation.dart';

// class Product {
//   String name;
//   double price;
//   String image;
//   String description;
//   String rating;
//   String reviews;
//   bool isFavorite;
//   int quantity;
//   List<dynamic>? sizes;
//   List<Color>? colors;
//   dynamic selectedSize;
//   Color selectedColor;

//   Product({
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.description,
//     required this.rating,
//     required this.reviews,
//     required this.isFavorite,
//     this.sizes,
//     required this.quantity,
//     required this.selectedSize,
//     this.colors,
//     required this.selectedColor,
//   });
// }




// // class Product {
// //   String? name;
// //   double? price;
// //   String? image;
// //   String? description;
// //   String? rating;
// //   String? reviews;
// //   bool? isFavorite;
// //   int? quantity;
// //   List<dynamic>? sizes;
// //   List<dynamic>? colors;
// //   dynamic selectedSize;
// //   Color selectedColor;
// //   String? category;

// //   Product({
// //     required this.name,
// //     required this.price,
// //     this.image,
// //     required this.description,
// //     this.rating,
// //     this.reviews,
// //     this.isFavorite,
// //     this.sizes,
// //     required this.quantity,
// //     this.selectedSize,
// //     this.colors,
// //     this.selectedColor,
// //     this.category,
// //   });

// //   factory Product.fromJson(Map<String, dynamic> json) {
// //     List<dynamic> sizes = [];
// //     List<ColorsList> colors = [];
// //     for (var element in (json['size'] as Iterable)) {
// //       sizes.add(element);
// //     }
// //     for (var element in (json['colors'] as Iterable)) {
// //       colors.add(element);
// //     }
// //     return Product(
// //         name: json['name'],
// //         price: json["price"],
// //         sizes: sizes,
// //         colors: colors,
// //         description: json["description"],
// //         quantity: json["inventory"]);
// //   }
// // }

// // class ColorsList {
// //   final List<Color> colors;
// //   ColorsList({
// //     required this.colors,
// //   });

// //   factory ColorsList.fromJson(Map<String, dynamic> json) {
// //     return ColorsList(
// //         colors:
// //             (json['colors'] as List).map((e) => Color.fromJson(e)).toList());
// //   }
// // }

// // class Color {
// //   final String? id;
// //   final String? color;
// //   final List<Images> imageList;

// //   Color({
// //     required this.id,
// //     required this.color,
// //     required this.imageList,
// //   });

// //   factory Color.fromJson(Map<String, dynamic> json) {
// //     return Color(
// //         id: json["_id"],
// //         color: json["color"],
// //         imageList: (json["images"] as List<Images>).map((e) => e).toList());
// //   }
// // }

// // class Images {
// //   final String? image;
// //   Images({
// //     required this.image,
// //   });
// // }
