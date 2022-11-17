import 'package:ecommerce/model/home_product_model.dart';
import 'package:ecommerce/model/product_model.dart';

class ProductDetailArguments {
  final int index;
  final ProductElement product;

  ProductDetailArguments({
    required this.index,
    required this.product,
  });
}
