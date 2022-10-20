import 'package:ecommerce/model/home_product_model.dart';

class ProductDetailArguments {
  final int index;
  final Product product;

  ProductDetailArguments({
    required this.index,
    required this.product,
  });
}
