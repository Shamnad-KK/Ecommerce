import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/model/home_product_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/view/home/widgets/product_status_widget.dart';
import 'package:ecommerce/view/product_detail/product_detail_arguments.dart';
import 'package:ecommerce/widgets/add_or_remove_favorite_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeItemCardWidget extends StatelessWidget {
  const HomeItemCardWidget({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<Product> list;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return list.isEmpty
        ? const Center(
            child: Text("Add Product"),
          )
        : GridView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.45,
              crossAxisSpacing: 20,
              mainAxisSpacing: 30,
            ),
            itemBuilder: (context, index) {
              final Product product = list[index];
              return GestureDetector(
                onTap: () {
                  ProductDetailArguments args =
                      ProductDetailArguments(index: index);
                  Navigator.of(context).pushNamed(
                    RouteNames.productDetail,
                    arguments: args,
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height * 0.2,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        image: DecorationImage(
                          image: AssetImage(
                            product.image,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: AppPadding.allside5,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: AddorRemoveFavoriteWidget(index: index),
                        ),
                      ),
                    ),
                    AppSpacing.kHeight5,
                    Text(
                      product.name,
                      style: AppTextStyle.body2,
                    ),
                    SizedBox(
                      width: size.width * 0.3,
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
  }
}
