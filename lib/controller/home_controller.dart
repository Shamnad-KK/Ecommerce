import 'package:ecommerce/model/home_category_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    getAllCategories();
    getAllProducts();
  }
  HomeServices homeServices = HomeServices();

  bool isLoading = false;

  Products? products;

  // List<Product> productList = [
  //   Product(
  //     name: "Casual Shirt",
  //     price: 400,
  //     image: "assets/home/download (1).jpg",
  //     description: "This is a good product",
  //     rating: "4.3",
  //     reviews: "1234",
  //     isFavorite: false,
  //     sizes: [30, 34, 36],
  //     colors: [
  //       Colors.green,
  //       Colors.white,
  //       Colors.blue,
  //     ],
  //     selectedColor: Colors.green,
  //     selectedSize: 30,
  //     quantity: 1,
  //   ),
  //   Product(
  //     name: "Formal Shirt",
  //     price: 500,
  //     image: "assets/onboarding/f.png",
  //     description: "This is a good product",
  //     rating: "4.5",
  //     reviews: "4321",
  //     isFavorite: false,
  //     sizes: [34, 35, 38],
  //     colors: [
  //       Colors.green,
  //       Colors.white,
  //       Colors.blue,
  //     ],
  //     selectedSize: 35,
  //     selectedColor: Colors.green,
  //     quantity: 1,
  //   ),
  // ];

  List<HomeCategoryModel> categoryList = [];

  void getAllCategories() async {
    isLoading = true;
    notifyListeners();
    await homeServices.getAllCategories().then((value) {
      if (value.isNotEmpty) {
        categoryList = value;
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void getAllProducts() async {
    isLoading = true;
    notifyListeners();
    await homeServices.getAllProducts().then((value) {
      if (value != null) {
        products = value;
      }
    });
    isLoading = false;
    notifyListeners();
    //log(products?.count.toString() ?? "null");
  }

  void setFavorite(int index) {
    // productList[index].isFavorite = !productList[index].isFavorite;
    // notifyListeners();
    // log(productList[index].isFavorite.toString());
  }
}
