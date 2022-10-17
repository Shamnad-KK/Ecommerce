import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/view/home/widgets/home_appbar_widget.dart';
import 'package:ecommerce/view/home/widgets/home_carousel_widget.dart';
import 'package:ecommerce/view/home/widgets/home_category_widget.dart';
import 'package:ecommerce/view/home/widgets/home_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                          title: "Jersey",
                          image: "assets/home/icons8-basketball-jersey-96.png",
                          onTap: () {},
                        ),
                        HomeScreenCategoryWidget(
                          title: "Coat",
                          image: "assets/home/icons8-coat-96.png",
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
                  GridView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: size.height * 0.2,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                  "assets/home/download (1).jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: AppPadding.allside5,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  padding: AppPadding.allside2,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Consumer<HomeController>(builder:
                                      (BuildContext context, value,
                                          Widget? child) {
                                    return InkWell(
                                      onTap: () {
                                        value.setFavorite(index);
                                      },
                                      child: Icon(
                                        CupertinoIcons.heart_fill,
                                        color: value.favoriteBoolList[index]
                                            ? AppColors.redColor
                                            : AppColors.whiteColor,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                          const Text("hy")
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
