import 'package:get/get.dart';
// import 'package:home_page/model/product_model.dart';
import '../model/product_model_api.dart';
// import 'package:home_page/service/product_service.dart';
// import 'package:home_page/utils/product_dummy.dart';

class ProductController extends GetxController {
  var favoriteProducts = <String>[].obs;
  var showFavoritesOnly = false.obs;
  var selectedType = 'All'.obs;
  RxString searchQuery = ''.obs;
  var allProducts = <ProductElement>[].obs;

  var productList = <Product>[].obs;
  // var product = Product().obs;
  var isLoading = true.obs;

  // bool isFavorite(String productId) {
  //   return favoriteProducts.contains(productId);
  // }

  List<ProductElement> getFavoriteProducts(List<ProductElement> allProducts) {
    return allProducts
        .where((product) => favoriteProducts.contains(product.id))
        .toList();
  }

  var favorites = <int>{}.obs;

  bool isFavorite(int productId) {
    return favorites.contains(productId);
  }

  void toggleFavorite(ProductElement product) {
    if (isFavorite(product.id)) {
      favorites.remove(product.id);
    } else {
      favorites.add(product.id);
    }
  }

  List<ProductElement> get filteredProducts {
    if (selectedType.value == 'All') {
      return allProducts;
    }
    return allProducts
        .where((product) => product.category == selectedType.value)
        .toList();
  }

  void filterProducts(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(
        allProducts.where((product) =>
            product.title.toLowerCase().contains(query.toLowerCase()) ||
            product.description.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }
}
