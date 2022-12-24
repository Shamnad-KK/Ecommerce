import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_url.dart';
import '../../../controller/product_detail_controller.dart';
import '../../../helpers/app_colors.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/custom_indicator_widget.dart';

class ProductDetailCarouselWidget extends StatelessWidget {
  const ProductDetailCarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ProductDetailController>(
        builder: (BuildContext context, productDetailConsumer, Widget? child) {
      final product = productDetailConsumer.productElement;
      return CarouselSlider.builder(
        itemCount: product!.image!.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            height: size.height * 0.51,
            width: size.width,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              image: DecorationImage(
                image: NetworkImage(
                    "${AppUrls.networkImageUrl}products/${product.image?[index] ?? AppUtils.dummyImage}"),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomIndicatorWidget(
                    index: index,
                    activeColor: AppColors.mainColor,
                    count: product.image!.length,
                    inactiveColor: AppColors.indicatorInactiveColor),
              ),
            ),
          );
        },
        options: CarouselOptions(
            viewportFraction: 1, aspectRatio: 1, enableInfiniteScroll: false),
      );
    });
  }
}
