import 'package:ecommerce/controller/wishlist_controller.dart';
import 'package:ecommerce/helpers/app_padding.dart';
import 'package:ecommerce/view/home/widgets/home_item_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wishlist"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: AppPadding.mainPading,
          child: Consumer<WishlistController>(
              builder: (BuildContext context, value, Widget? child) {
            return HomeItemCardWidget(
              list: value.wishList,
            );
          }),
        ),
      ),
    );
  }
}