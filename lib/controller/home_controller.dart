import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List favoriteBoolList = List.generate(10, (index) => false);

  void setFavorite(int index) {
    favoriteBoolList[index] = !favoriteBoolList[index];
    notifyListeners();
  }
}
