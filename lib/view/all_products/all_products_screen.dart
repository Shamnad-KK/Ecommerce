import 'package:ecommerce/helpers/app_padding.dart';
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
          children: const [
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
