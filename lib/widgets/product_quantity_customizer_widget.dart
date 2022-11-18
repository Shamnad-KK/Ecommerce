import 'package:ecommerce/controller/product_detail_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductQuantityCustomizerWidget extends StatelessWidget {
  const ProductQuantityCustomizerWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductElement product;

  @override
  Widget build(BuildContext context) {
    // final productDetailController =
    //     Provider.of<ProductDetailController>(context, listen: false);
    // final cartController = Provider.of<CartController>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // productDetailController.decreaseQuantity(product);
              // cartController.calculateTotalPrice();
            },
            icon: const Icon(
              Icons.remove,
            ),
          ),
          Consumer<ProductDetailController>(
              builder: (BuildContext context, value, Widget? child) {
            return const Text("1");
          }),
          IconButton(
            onPressed: () {
              // productDetailController.increaseQuantity(product);
              // cartController.calculateTotalPrice();
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
