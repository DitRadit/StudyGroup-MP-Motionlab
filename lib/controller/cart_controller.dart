import 'package:get/get.dart';
import 'package:home_page/model/product_model_api.dart'; 

class CartController extends GetxController {
  RxDouble totalProduct = 0.0.obs;
  RxMap<int, int> quantities = <int, int>{}.obs;  
  var cartProducts = <ProductElement>[].obs;

  // Increment product quantity
  void incrementQuantity(int productId) {
    var product = cartProducts.firstWhere((product) => product.id == productId);
    int currentQuantity = quantities[productId] ?? 0;
    quantities[productId] = currentQuantity + 1;
  }

  // Decrement product quantity
  void decrementQuantity(int productId) {
    var product = cartProducts.firstWhere((product) => product.id == productId);
    int currentQuantity = quantities[productId] ?? 0;

    if (currentQuantity > 1) {
      quantities[productId] = currentQuantity - 1;
    } else {
      quantities.remove(productId);
      cartProducts.remove(product);
    }
  }

  int getQuantity(int productId) {
    return quantities[productId] ?? 0;
  }

  double calculateTotal() {
    double total = 0.0;
    quantities.forEach((productId, quantity) {
      ProductElement product = cartProducts.firstWhere(
        (product) => product.id == productId,
      );
      total += product.price * quantity;
    });
    return total;
  }

  void addToCart(ProductElement product) {
    if (quantities.containsKey(product.id)) {
      incrementQuantity(product.id);
    } else {
      cartProducts.add(product);
      quantities[product.id] = 1;
    }
  }
}
