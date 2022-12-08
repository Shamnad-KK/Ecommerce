import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/widgets/custom_indicator_widget.dart';
import 'package:ecommerce/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/shimmers.dart';

class HomeScreenCarouselWidget extends StatelessWidget {
  const HomeScreenCarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<HomeController>(
      builder: (context, value, child) =>
          value.isLoading || value.carousalList == null
              ? HomeShimmers.carouserShimmer(context)
              : CarouselSlider.builder(
                  itemCount: value.carousalList!.length,
                  itemBuilder: (context, index, realIndex) {
                    final carousal = value.carousalList![index];
                    return Padding(
                      padding: AppPadding.sidePading15,
                      child: Container(
                        padding: AppPadding.mainPading,
                        width: size.width,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          image: DecorationImage(
                            image: NetworkImage(
                              carousal.image,
                            ),
                            fit: BoxFit.cover,
                            opacity: 0.7,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: AppPadding.sidePading5,
                                    child: SizedBox(
                                      height: size.height,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "${carousal.offer}%",
                                            style: AppTextStyle.headline3,
                                          ),
                                          Text(
                                            carousal.title,
                                            style: AppTextStyle.body1,
                                          ),
                                          Text(
                                            carousal.description,
                                            style: AppTextStyle.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: CustomIndicatorWidget(
                                index: index,
                                activeColor: AppColors.whiteColor,
                                count: 3,
                                inactiveColor: AppColors.indicatorInactiveColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 1.0,
                  ),
                ),
    );
  }
}
