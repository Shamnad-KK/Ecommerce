import 'package:ecommerce/widgets/custom_notfound_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final cartController = Provider.of<CartController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // cartController.calculateTotalPrice();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: const CustomNotFoundWidget(
          title: 'Your cart is empty',
          subtitle: "You haven't added any products"),

      //  SafeArea(
      //   child: Consumer<CartController>(
      //       builder: (BuildContext context, value, Widget? child) {
      //     if (value.cartList.isEmpty) {
      //       return const Center(
      //         child: CustomNotFoundWidget(
      //           title: "Your cart is empty",
      //           subtitle: "You haven't added any products",
      //         ),
      //       );
      //     } else {
      //       return Column(
      //         children: [
      //           Expanded(
      //             child: ListView.separated(
      //               itemCount: value.cartList.length,
      //               scrollDirection: Axis.vertical,
      //               itemBuilder: (context, index) {
      //                 final product = value.cartList[index];
      //                 return Container(
      //                   margin: AppPadding.sidePading15,
      //                   padding: AppPadding.mainPading,
      //                   height: size.height * 0.17,
      //                   width: size.width,
      //                   decoration: BoxDecoration(
      //                     color: AppColors.mediaButtonBg,
      //                     borderRadius: BorderRadius.circular(20),
      //                   ),
      //                   child: Row(
      //                     children: [
      //                       Container(
      //                         height: size.height,
      //                         width: size.width * 0.3,
      //                         decoration: BoxDecoration(
      //                           color: AppColors.mainColor,
      //                           image: DecorationImage(
      //                               image: AssetImage(product.image),
      //                               fit: BoxFit.fill),
      //                           borderRadius: BorderRadius.circular(15),
      //                         ),
      //                       ),
      //                       AppSpacing.kWidth10,
      //                       Column(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Row(
      //                             mainAxisAlignment:
      //                                 MainAxisAlignment.spaceBetween,
      //                             children: [
      //                               Text(product.name,
      //                                   style: AppTextStyle.body1),
      //                               AppSpacing.kWidth30,
      //                               GestureDetector(
      //                                 onTap: () {
      //                                   cartController.removeProductFromCart(
      //                                       product, context);
      //                                 },
      //                                 child: const Icon(Icons.delete_outline),
      //                               )
      //                             ],
      //                           ),
      //                           SizedBox(
      //                             width: size.width * 0.2,
      //                             child: Row(
      //                               mainAxisAlignment:
      //                                   MainAxisAlignment.spaceBetween,
      //                               children: [
      //                                 CircleAvatar(
      //                                   backgroundColor: product.selectedColor,
      //                                   radius: 10,
      //                                 ),
      //                                 const Text("|"),
      //                                 const Text(
      //                                   "Size =",
      //                                   style: AppTextStyle.labelSmall,
      //                                 ),
      //                                 Text(
      //                                   "${product.selectedSize}",
      //                                   style: AppTextStyle.labelSmall,
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                           Row(
      //                             mainAxisAlignment:
      //                                 MainAxisAlignment.spaceBetween,
      //                             children: [
      //                               Text(
      //                                 "\$ ${product.price}",
      //                                 style: AppTextStyle.body1,
      //                               ),
      //                               AppSpacing.kWidth10,
      //                               // ProductQuantityCustomizerWidget(
      //                               //     product: product)
      //                             ],
      //                           ),
      //                         ],
      //                       )
      //                     ],
      //                   ),
      //                 );
      //               },
      //               separatorBuilder: (context, index) {
      //                 return AppSpacing.kHeight20;
      //               },
      //             ),
      //           ),
      //           Container(
      //             height: size.height * 0.1,
      //             padding: AppPadding.mainPading,
      //             decoration: BoxDecoration(
      //               color: AppColors.mediaButtonBg,
      //               border: Border.all(
      //                 color: AppColors.borderColor,
      //               ),
      //             ),
      //             child: Row(
      //               children: [
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     const Text(
      //                       "Total Price",
      //                       style: AppTextStyle.subtitle2,
      //                     ),
      //                     Consumer<CartController>(
      //                       builder:
      //                           (BuildContext context, value, Widget? child) {
      //                         return SizedBox(
      //                           width: size.width * 0.35,
      //                           child: Text(
      //                             "\$ ${value.totalPrice}",
      //                             style: AppTextStyle.body1,
      //                             overflow: TextOverflow.ellipsis,
      //                           ),
      //                         );
      //                       },
      //                     ),
      //                   ],
      //                 ),
      //                 AppSpacing.kWidth10,
      //                 Expanded(
      //                   child: CustomButtonWidget(
      //                     text: "Checkout",
      //                     onTap: () {
      //                       Navigator.of(context)
      //                           .pushNamed(RouteNames.stepperScreen);
      //                     },
      //                   ),
      //                 )
      //               ],
      //             ),
      //           )
      //         ],
      //       );
      //     }
      //   }),
      // ),
    );
  }
}
