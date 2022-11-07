import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/helpers/app_spacing.dart';
import 'package:ecommerce/view/home/widgets/home_appbar_widget.dart';
import 'package:ecommerce/view/home/widgets/home_carousel_widget.dart';
import 'package:ecommerce/view/home/widgets/home_category_widget.dart';
import 'package:ecommerce/view/home/widgets/home_item_card_widget.dart';
import 'package:ecommerce/view/home/widgets/home_row_widget.dart';
import 'package:ecommerce/widgets/custom_loading_widget.dart';
import 'package:ecommerce/widgets/custom_notfound_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final homeController = Provider.of<HomeController>(context, listen: false);
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   homeController.getAllCategories();
    // });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          size.height * 0.16,
        ),
        child: const HomeAppBarWidget(),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: AppPadding.mainPading,
                  child: HomeRowWidget(
                    leading: "Special Offers",
                    trailing: "See all",
                    onTap: () {},
                  ),
                ),
                AppSpacing.kHeight20,
                const HomeScreenCarouselWidget(),
                Padding(
                  padding: AppPadding.mainPading,
                  child: Column(
                    children: [
                      SizedBox(
                        child: Consumer<HomeController>(
                          builder:
                              (BuildContext context, value, Widget? child) {
                            return value.isLoading
                                ? const CustomLoadingWidget()
                                : value.categoryList.isEmpty
                                    ? const CustomNotFoundWidget(
                                        title: "No categories found",
                                        subtitle:
                                            "There are no categories in the API")
                                    : Center(
                                        child: SizedBox(
                                          height: 100,
                                          width: size.width,
                                          child: Center(
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  value.categoryList.length,
                                              itemBuilder: (context, index) {
                                                final category =
                                                    value.categoryList[index];
                                                return Row(
                                                  children: [
                                                    HomeScreenCategoryWidget(
                                                      title: category.name,
                                                      image: category.image,
                                                      onTap: () {},
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                          },
                        ),
                      ),
                      AppSpacing.kHeight30,
                      HomeRowWidget(
                        leading: "Most Popular",
                        trailing: "See all",
                        onTap: () {},
                      ),
                      AppSpacing.kHeight10,
                      Consumer<HomeController>(builder:
                          (BuildContext context, value, Widget? child) {
                        return HomeItemCardWidget(
                          list: value.productList,
                        );
                      })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
