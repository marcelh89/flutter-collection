import 'package:get/get.dart';

import '../models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResult = [
      Product(1, 'some description about product', 'abd', 'FirstProduct', 30),
      Product(2, 'some description about product', 'abd', 'SecondProduct', 40),
      Product(3, 'some description about product', 'abd', 'ThirdProduct', 49.5),
    ];

    products.value = productResult;
  }
}
