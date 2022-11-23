import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductQuantityCustomizerWidget extends StatelessWidget {
  const ProductQuantityCustomizerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (BuildContext context, value, Widget? child) {
        return Container(
          padding: AppPadding.allside5,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  // value.decrementQuantity();
                },
                child: const Icon(
                  Icons.remove,
                ),
              ),
              Text(value.totalQuantity.toString()),
              GestureDetector(
                  onTap: () {
                    //  value.incrementQuantity();
                  },
                  child: const Icon(Icons.add)),
            ],
          ),
        );
      },
    );
  }
}
