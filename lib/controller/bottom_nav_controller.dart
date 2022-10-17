import 'package:ecommerce/view/account/account_screen.dart';
import 'package:ecommerce/view/cart/cart_screen.dart';
import 'package:ecommerce/view/home/home_screen.dart';
import 'package:ecommerce/view/orders/orders_screen.dart';
import 'package:flutter/material.dart';

class BottomNavController extends ChangeNotifier {
  final List<Widget> _pageList = [
    const HomeScreen(),
    const CartScreen(),
    const OrdersScreen(),
    const AccountScreen(),
  ];

  List<Widget> get pageList => _pageList;

  int currentIndex = 0;

  void setNewIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
