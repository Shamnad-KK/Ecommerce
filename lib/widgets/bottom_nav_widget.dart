import 'package:ecommerce/controller/bottom_nav_controller.dart';
import 'package:ecommerce/helpers/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomnavController =
        Provider.of<BottomNavController>(context, listen: false);
    return Scaffold(
      body: context
          .watch<BottomNavController>()
          .pageList[bottomnavController.currentIndex],
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomNavigationBar(
          iconSize: 20,
          backgroundColor: AppColors.bgColor,
          currentIndex: bottomnavController.currentIndex,
          elevation: 0,
          selectedItemColor: AppColors.bottomNavActiveColor,
          unselectedItemColor: AppColors.bottomNavInactiveColor,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: 'Orders'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
          onTap: (value) {
            bottomnavController.setNewIndex(value);
          },
        ),
      ),
    );
  }
}
