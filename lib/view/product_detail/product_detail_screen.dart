import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/product_detail_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/model/home_product_model.dart';
import 'package:ecommerce/view/home/widgets/product_status_widget.dart';
import 'package:ecommerce/widgets/add_or_remove_favorite_widget.dart';
import 'package:ecommerce/widgets/custom_button.dart';
import 'package:ecommerce/widgets/product_quantity_customizer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final cartController = Provider.of<CartController>(context, listen: false);
    final productDetailController =
        Provider.of<ProductDetailController>(context, listen: false);

    Product newProduct = productDetailController.productList[index];
    newProduct.quantity = 1;
    double price = newProduct.price;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      productDetailController.setChip(0);
      productDetailController.setColor(0);
    });
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.5,
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  image: DecorationImage(
                    image: AssetImage(newProduct.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: AppPadding.mainPading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          newProduct.name,
                          style: AppTextStyle.titleLarge,
                        ),
                        AddorRemoveFavoriteWidget(index: index),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      child: ProductStatusWidget(product: newProduct),
                    ),
                    AppSpacing.kHeight10,
                    const Divider(
                      color: AppColors.divider,
                    ),
                    AppSpacing.kHeight10,
                    const Text(
                      "Descriptioin",
                      style: AppTextStyle.body1,
                    ),
                    AppSpacing.kHeight5,
                    Text(
                      newProduct.description,
                      style: AppTextStyle.subtitle2,
                    ),
                    AppSpacing.kHeight20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Size", style: AppTextStyle.body1),
                        AppSpacing.kHeight5,
                        Consumer<ProductDetailController>(
                          builder:
                              (BuildContext context, value, Widget? child) {
                            return SizedBox(
                              height: size.height * 0.05,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  for (int i = 0;
                                      i < newProduct.sizes!.length;
                                      i++)
                                    ChoiceChip(
                                      backgroundColor: AppColors.mainColor,
                                      labelStyle: AppTextStyle.body2,
                                      label: Text(
                                        newProduct.sizes![i].toString(),
                                        style: AppTextStyle.body2.copyWith(
                                            color: value.selectedChipIndex == i
                                                ? AppColors.blackColor
                                                : AppColors.whiteColor),
                                      ),
                                      selected: value.selectedChipIndex == i,
                                      selectedColor: AppColors.whiteColor,
                                      onSelected: (bool _) {
                                        value.setChip(i);
                                      },
                                    ),
                                  AppSpacing.kWidth50,
                                  for (int i = 0;
                                      i < newProduct.colors!.length;
                                      i++)
                                    GestureDetector(
                                      onTap: () {
                                        value.setColor(i);
                                      },
                                      child: Container(
                                        padding: AppPadding.allside2,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color:
                                                  value.selectedColorIndex == i
                                                      ? AppColors.whiteColor
                                                      : AppColors.transparent,
                                              width: 3),
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor:
                                              newProduct.colors![i],
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            );
                          },
                        ),
                        AppSpacing.kHeight10,
                        Row(
                          children: [
                            const Text(
                              "Quantity",
                              style: AppTextStyle.body1,
                            ),
                            AppSpacing.kWidth10,
                            ProductQuantityCustomizerWidget(
                                product: newProduct),
                          ],
                        ),
                        AppSpacing.kHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: size.width * 0.3,
                              child: Consumer<ProductDetailController>(
                                builder: (BuildContext context, value,
                                    Widget? child) {
                                  return Text(
                                    "\$ ${value.productList[index].price}",
                                    style: AppTextStyle.titleMedium,
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomButtonWidget(
                                text: "Add to cart",
                                onTap: () {
                                  Product cartProduct = Product(
                                    name: newProduct.name,
                                    price: newProduct.price,
                                    image: newProduct.image,
                                    description: newProduct.description,
                                    rating: newProduct.rating,
                                    reviews: newProduct.reviews,
                                    isFavorite: newProduct.isFavorite,
                                    selectedSize: newProduct.sizes![
                                        productDetailController
                                            .selectedChipIndex],
                                    quantity: newProduct.quantity,
                                    selectedColor: newProduct.colors![
                                        productDetailController
                                            .selectedColorIndex],
                                  );
                                  cartController.addProductToCart(cartProduct);
                                  newProduct.price = price;
                                  Navigator.of(context).pop();
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
