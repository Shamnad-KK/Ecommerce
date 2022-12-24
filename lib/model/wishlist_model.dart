import 'package:ecommerce/model/product_model.dart';

class WishlistProductElement {
  WishlistProductElement({
    required this.product,
  });

  final ProductElement product;

  factory WishlistProductElement.fromJson(Map<String, dynamic> json) =>
      WishlistProductElement(
        product: ProductElement.fromJson(json["product"]),
      );
}
