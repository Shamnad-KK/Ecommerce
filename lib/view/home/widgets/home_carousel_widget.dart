import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/apptext_style.dart';
import 'package:ecommerce/widgets/custom_indicator_widget.dart';
import 'package:flutter/material.dart';

class HomeScreenCarouselWidget extends StatelessWidget {
  const HomeScreenCarouselWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: size.width,
          height: size.height * 0.2,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "30%",
                              style: AppTextStyle.headline3,
                            ),
                            Text(
                              "Today's Special",
                              style: AppTextStyle.body1,
                            ),
                            Text(
                              "Get discount for every\norder. Only valid for today",
                              style: AppTextStyle.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/onboarding/f.png",
                          ),
                          fit: BoxFit.cover,
                          opacity: 0.7,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 10,
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
        );
      },
      options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: true,
        viewportFraction: 1.0,
      ),
    );
  }
}
