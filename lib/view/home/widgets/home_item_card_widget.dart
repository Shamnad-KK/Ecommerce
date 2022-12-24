import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/utils/app_utils.dart';
import 'package:ecommerce/view/home/widgets/product_status_widget.dart';
import 'package:ecommerce/widgets/add_or_remove_favorite_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_url.dart';

class HomeItemCardWidget extends StatelessWidget {
  const HomeItemCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<HomeController>(
      builder: (context, value, child) {
        final list = value.products;
        return GridView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.60,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
          ),
          itemBuilder: (context, index) {
            final product = list[index];

            return GestureDetector(
              onTap: () {
                log(product.id!);
                value.gotoProductDetails(context, product.id!);
                // productDetailController.getOneProduct(
                //     context: context, productId: product.id!);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height * 0.25,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          "${AppUrls.networkImageUrl}products/${product.image?[0] ?? AppUtils.dummyImage}",
                        ),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: AppPadding.allside5,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: AddorRemoveFavoriteWidget(
                          productId: product.id!,
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.kHeight5,
                  Text(
                    product.name ?? "",
                    style: AppTextStyle.body2,
                  ),
                  SizedBox(
                    width: size.width * 0.36,
                    child: const ProductStatusWidget(),
                  ),
                  Row(
                    children: [
                      Text(
                        "₹${product.discountPrice?.round()}",
                        style: AppTextStyle.body2,
                      ),
                      AppSpacing.kWidth20,
                      Text(
                        "₹ ${product.price?.round()}",
                        style: AppTextStyle.body2.copyWith(
                            color: AppColors.indicatorInactiveColor,
                            decoration: TextDecoration.lineThrough),
                      ),
                      AppSpacing.kWidth5,
                      Text(
                        "${product.offer?.round()}% OFF",
                        style: AppTextStyle.bodySmall
                            .copyWith(color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
