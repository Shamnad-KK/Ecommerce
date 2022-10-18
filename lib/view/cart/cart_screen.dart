import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/widgets/product_quantity_customizer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartController = Provider.of<CartController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<CartController>(
            builder: (BuildContext context, value, Widget? child) {
          return value.cartList.isEmpty
              ? const Center(
                  child: Text("Add Products"),
                )
              : ListView.separated(
                  itemCount: value.cartList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final product = value.cartList[index];
                    return Container(
                      margin: AppPadding.sidePading15,
                      padding: AppPadding.mainPading,
                      height: size.height * 0.17,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: AppColors.mediaButtonBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: size.height,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              image: DecorationImage(
                                  image: AssetImage(product.image),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          AppSpacing.kWidth10,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(product.name, style: AppTextStyle.body1),
                                  GestureDetector(
                                    onTap: () {
                                      cartController
                                          .removeProductFromCart(product);
                                    },
                                    child: const Icon(Icons.delete_outline),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: size.width * 0.2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    CircleAvatar(
                                      backgroundColor: AppColors.mainColor,
                                      radius: 10,
                                    ),
                                    Text("|"),
                                    Text(
                                      "Size-M",
                                      style: AppTextStyle.labelSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$ ${product.price}",
                                    style: AppTextStyle.body1,
                                  ),
                                  AppSpacing.kWidth10,
                                  ProductQuantityCustomizerWidget(
                                      product: product)
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return AppSpacing.kHeight20;
                  },
                );
        }),
      ),
    );
  }
}
