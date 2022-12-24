import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/product_detail_controller.dart';
import '../../../helpers/app_colors.dart';
import '../../../helpers/app_spacing.dart';
import '../../../helpers/apptext_style.dart';

class ProductSizeVariant extends StatelessWidget {
  const ProductSizeVariant({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final product = context.read<ProductDetailController>().productElement;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Size", style: AppTextStyle.body1),
        AppSpacing.kHeight5,
        Consumer<ProductDetailController>(
          builder: (BuildContext context, value, Widget? child) {
            return SizedBox(
              height: size.height * 0.05,
              child: Row(
                children: [
                  SizedBox(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: product!.size!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            value.setSizeIndex(index);
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: value.selectedSizeIndex == index
                                ? AppColors.whiteColor
                                : AppColors.mainColor,
                            child: Center(
                              child: Text(
                                product.size![index].toString(),
                                style: AppTextStyle.body2.copyWith(
                                    color: value.selectedSizeIndex == index
                                        ? AppColors.blackColor
                                        : AppColors.whiteColor),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        AppSpacing.kHeight20,
      ],
    );
  }
}

// class ProductColorVariant extends StatelessWidget {
//   const ProductColorVariant({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final product = context.read<ProductDetailController>().productElement;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Color", style: AppTextStyle.body1),
//         AppSpacing.kHeight5,
//         Consumer<ProductDetailController>(
//           builder: (BuildContext context, value, Widget? child) {
//             return SizedBox(
//               height: size.height * 0.05,
//               child: Row(
//                 children: [
//                   SizedBox(
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       shrinkWrap: true,
//                       itemCount: product!.colors!.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             value.setColorIndex(index);
//                             value.setCarouselImage(index);
//                           },
//                           child: Container(
//                             padding: EdgeInsets.zero,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                   color: AppColors.whiteColor, width: 1),
//                             ),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                     color: value.selectedColorIndex == index
//                                         ? AppColors.whiteColor
//                                         : AppColors.transparent,
//                                     width: 3),
//                               ),
//                               child: CircleAvatar(
//                                 backgroundColor: Color(int.parse(
//                                     product.colors?[index].color ?? "0xFFB")),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//         AppSpacing.kHeight20,
//       ],
//     );
//   }
// }
