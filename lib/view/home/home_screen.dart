import 'dart:developer';

import 'package:ecommerce/helpers/token_manager.dart';
import 'package:ecommerce/view/home/widgets/home_appbar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    log('home build called');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          size.width,
          size.height * 0.16,
        ),
        child: GestureDetector(
            onTap: () {
              TokenManager().deleteTokens();
            },
            child: const HomeAppBarWidget()),
      ),
      // body: Consumer<HomeController>(
      //   builder: (BuildContext context, value, Widget? child) {
      //     return SafeArea(
      //       child: value.isLoading
      //           ? Column(
      //               children: [
      //                 HomeShimmers.carouserShimmer(context),
      //                 HomeShimmers.homeRowShimmers(context),
      //                 AppSpacing.kHeight20,
      //                 HomeShimmers.categoryShimmer(context),
      //                 AppSpacing.kHeight30,
      //                 HomeShimmers.homeRowShimmers(context),
      //                 AppSpacing.kHeight20,
      //                 Expanded(
      //                     child: HomeShimmers.homeProductCardShimmer(context))
      //               ],
      //             )
      //           : GestureDetector(
      //               onTap: () {
      //                 FocusScope.of(context).requestFocus(FocusNode());
      //               },
      //               child: SingleChildScrollView(
      //                 physics: const BouncingScrollPhysics(),
      //                 child: Column(
      //                   children: [
      //                     Padding(
      //                       padding: AppPadding.mainPading,
      //                       child: HomeRowWidget(
      //                         leading: "Special Offers",
      //                         trailing: "See all",
      //                         onTap: () {},
      //                       ),
      //                     ),
      //                     CarouselSlider.builder(
      //                       itemCount: value.carousalList.length,
      //                       itemBuilder: (context, index, realIndex) {
      //                         final carousal = value.carousalList[index];
      //                         return Padding(
      //                           padding: AppPadding.sidePading15,
      //                           child: Container(
      //                             padding: AppPadding.mainPading,
      //                             width: size.width,
      //                             height: size.height * 0.2,
      //                             decoration: BoxDecoration(
      //                               color: AppColors.mainColor,
      //                               image: DecorationImage(
      //                                 image: NetworkImage(
      //                                   carousal.image,
      //                                 ),
      //                                 fit: BoxFit.cover,
      //                                 opacity: 0.7,
      //                               ),
      //                               borderRadius: BorderRadius.circular(20),
      //                             ),
      //                             child: Stack(
      //                               children: [
      //                                 Row(
      //                                   children: [
      //                                     Expanded(
      //                                       child: Padding(
      //                                         padding: AppPadding.sidePading5,
      //                                         child: SizedBox(
      //                                           height: size.height,
      //                                           child: Column(
      //                                             crossAxisAlignment:
      //                                                 CrossAxisAlignment.start,
      //                                             mainAxisAlignment:
      //                                                 MainAxisAlignment
      //                                                     .spaceEvenly,
      //                                             children: [
      //                                               Text(
      //                                                 "${carousal.offer}%",
      //                                                 style: AppTextStyle
      //                                                     .headline3,
      //                                               ),
      //                                               Text(
      //                                                 carousal.title,
      //                                                 style: AppTextStyle.body1,
      //                                               ),
      //                                               Text(
      //                                                 carousal.description,
      //                                                 style: AppTextStyle
      //                                                     .bodySmall,
      //                                               ),
      //                                             ],
      //                                           ),
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 Positioned(
      //                                   bottom: 0,
      //                                   left: 0,
      //                                   right: 0,
      //                                   child: CustomIndicatorWidget(
      //                                     index: index,
      //                                     activeColor: AppColors.whiteColor,
      //                                     count: 3,
      //                                     inactiveColor:
      //                                         AppColors.indicatorInactiveColor,
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         );
      //                       },
      //                       options: CarouselOptions(
      //                         autoPlay: true,
      //                         enableInfiniteScroll: true,
      //                         viewportFraction: 1.0,
      //                       ),
      //                     ),
      //                     AppSpacing.kHeight20,
      //                     Padding(
      //                       padding: AppPadding.mainPading,
      //                       child: Column(
      //                         children: [
      //                           SizedBox(
      //                             height: 80,
      //                             child: Consumer<HomeController>(
      //                               builder:
      //                                   (BuildContext _, value, Widget? child) {
      //                                 return Center(
      //                                   child: Center(
      //                                     child: ListView.builder(
      //                                       shrinkWrap: true,
      //                                       scrollDirection: Axis.horizontal,
      //                                       itemCount:
      //                                           value.categoryList.length,
      //                                       itemBuilder: (ctx, index) {
      //                                         final category =
      //                                             value.categoryList[index];
      //                                         return Row(
      //                                           children: [
      //                                             HomeScreenCategoryWidget(
      //                                               title: category.name,
      //                                               image: category.image,
      //                                               onTap: () {
      //                                                 value.gotoProductFilter(
      //                                                   context,
      //                                                   category.id,
      //                                                   category.name,
      //                                                 );
      //                                               },
      //                                             ),
      //                                             index <
      //                                                     value.categoryList
      //                                                             .length -
      //                                                         1
      //                                                 ? SizedBox(
      //                                                     width:
      //                                                         size.width * 0.1,
      //                                                   )
      //                                                 : const SizedBox()
      //                                           ],
      //                                         );
      //                                       },
      //                                     ),
      //                                   ),
      //                                 );
      //                               },
      //                             ),
      //                           ),
      //                           AppSpacing.kHeight30,
      //                           HomeRowWidget(
      //                             leading: "Most Popular",
      //                             trailing: "See all",
      //                             onTap: () {},
      //                           ),
      //                           AppSpacing.kHeight20,
      //                           Consumer<HomeController>(builder:
      //                               (BuildContext context, value,
      //                                   Widget? child) {
      //                             return const HomeItemCardWidget();
      //                           })
      //                         ],
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //     );
      //   },
      // ),
    );
  }
}
