import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/utils/app_utils.dart';
import 'package:ecommerce/view/home/widgets/product_status_widget.dart';
import 'package:ecommerce/widgets/add_or_remove_favorite_widget.dart';
import 'package:ecommerce/widgets/custom_notfound_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/product_detail_controller.dart';

class HomeItemCardWidget extends StatelessWidget {
  const HomeItemCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productDetailController =
        Provider.of<ProductDetailController>(context, listen: false);
    return Consumer<HomeController>(
      builder: (context, value, child) {
        final list = value.products?.products ?? [];
        return list.isEmpty
            ? const Center(
                child: CustomNotFoundWidget(
                    title: "Your Product list is empty",
                    subtitle: "You have'nt added any products"),
              )
            : GridView.builder(
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
                  final ProductElement product = list[index];
                  return GestureDetector(
                    onTap: () {
                      productDetailController.getOneProduct(
                          context: context, productId: product.id!);
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
                              image: NetworkImage(
                                product.colors?[0].images[0] ??
                                    AppUtils.dummyImage,
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
                                product: product,
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
                          child: ProductStatusWidget(product: product),
                        ),
                        Text(
                          " \$ ${product.price}",
                          style: AppTextStyle.body2,
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
