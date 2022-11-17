import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/view/home/widgets/home_item_card_widget.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: AppPadding.mainPading,
        child: Column(
          children: [
            // Consumer<HomeController>(
            //   builder: (BuildContext context, value, Widget? child) {
            //     return HomeItemCardWidget(
            //       list: value.productList,
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
