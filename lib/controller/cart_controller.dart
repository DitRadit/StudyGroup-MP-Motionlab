import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/model/product_model.dart';
import 'package:home_page/utils/product_dummy.dart';

class CartController extends GetxController {
  RxDouble totalProduct = 0.0.obs;
  RxMap<String, int> quantities =
      <String, int>{}.obs;
  var cartProducts = <ProductModel>[].obs; 

  // Increment product quantity
  void incrementQuantity(String productId) {
    var product = cartProducts.firstWhere((product) => product.id == productId);
    int currentQuantity =
        quantities[productId] ?? 0; 
    quantities[productId] = currentQuantity + 1; 
  }

  // Decrement product quantity
  void decrementQuantity(String productId) {
    var product = cartProducts.firstWhere((product) => product.id == productId);
    int currentQuantity = quantities[productId] ?? 0;

    if (currentQuantity > 1) {
      quantities[productId] = currentQuantity - 1; 
    } else {
      quantities.remove(productId); 
      cartProducts.remove(product); 
    }
  }

  // Get the quantity of a product
  int getQuantity(String productId) {
    return quantities[productId] ?? 0; 
  }

  // Calculate the total price of the products in the cart
  double calculateTotal() {
    double total = 0.0;
    quantities.forEach((productId, quantity) {
      ProductModel product = DataDummy.listDummyProducts.firstWhere(
        (product) => product.id == productId,
      );
      total += product.price * quantity; 
    });
    return total;
  }

  // Add a product to the cart
  void addToCart(ProductModel product) {
    if (quantities.containsKey(product.id)) {
      incrementQuantity(product.id); 
    } else {
      cartProducts.add(product); 
      quantities[product.id] = 1; 
    }
  }
}
