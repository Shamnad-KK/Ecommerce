import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/model/home_product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailController extends ChangeNotifier {
  List<Product> productList = HomeController().productList;
  int selectedChipIndex = 0;
  int selectedColorIndex = 0;
  double realPrice = 0;

  void setChip(int newValue) {
    selectedChipIndex = newValue;
    notifyListeners();
  }

  void setColor(int newValue) {
    selectedColorIndex = newValue;
    notifyListeners();
  }

  void setProductInitialValues(Product newProduct) {
    newProduct.quantity = 1;
    realPrice = newProduct.price;
    notifyListeners();
  }

  void setQuantity(Product product) {
    product.quantity = 1;
    notifyListeners();
  }

  void increaseQuantity(Product product, double price) {
    product.quantity++;
    product.price = product.price + price;
    notifyListeners();
  }

  void decreaseQuantity(Product product, double price) {
    if (product.quantity == 1) {
      return;
    }
    product.price = product.price - price;
    product.quantity--;
    notifyListeners();
  }
}
