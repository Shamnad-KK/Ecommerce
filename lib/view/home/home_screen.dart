import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/view/home/widgets/home_appbar_widget.dart';
import 'package:ecommerce/view/home/widgets/home_carousel_widget.dart';
import 'package:ecommerce/view/home/widgets/home_category_widget.dart';
import 'package:ecommerce/view/home/widgets/home_item_card_widget.dart';
import 'package:ecommerce/view/home/widgets/home_row_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          size.height * 0.16,
        ),
        child: const HomeAppBarWidget(),
      ),
      body: SafeArea(
        child: Padding(
          padding: AppPadding.mainPading,
          child: SingleChildScrollView(
            child: Padding(
              padding: AppPadding.mainPading,
              child: Column(
                children: [
                  HomeRowWidget(
                    leading: "Special Offers",
                    trailing: "See all",
                    onTap: () {},
                  ),
                  AppSpacing.kHeight30,
                  const HomeScreenCarouselWidget(),
                  AppSpacing.kHeight30,
                  SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomeScreenCategoryWidget(
                          title: "Jeans",
                          image: "assets/home/icons8-jeans-96.png",
                          onTap: () {},
                        ),
                        HomeScreenCategoryWidget(
                          title: "Shirt",
                          image: "assets/home/icons8-shirt-96.png",
                          onTap: () {},
                        ),
                        HomeScreenCategoryWidget(
                          title: "Skirt",
                          image: "assets/home/skirt.png",
                          onTap: () {},
                        ),
                        HomeScreenCategoryWidget(
                          title: "T-Shirt",
                          image: "assets/home/tshirt.png",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.kHeight30,
                  HomeRowWidget(
                    leading: "Most Popular",
                    trailing: "See all",
                    onTap: () {},
                  ),
                  AppSpacing.kHeight10,
                  const HomeItemCardWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
