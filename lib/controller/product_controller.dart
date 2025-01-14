import 'package:get/get.dart';
import 'package:home_page/model/product_model.dart';
import 'package:home_page/utils/product_dummy.dart';

class ProductController extends GetxController {
  var favoriteProducts = <String>[].obs;
  var showFavoritesOnly = false.obs;
  var selectedType = 'All'.obs;
  RxString searchQuery = ''.obs;
  var allProducts = <ProductModel>[].obs;

  bool isFavorite(String productId) {
    return favoriteProducts.contains(productId);
  }

  List<ProductModel> getFavoriteProducts(List<ProductModel> allProducts) {
    return allProducts
        .where((product) => favoriteProducts.contains(product.id))
        .toList();
  }

  void toggleFavorite(ProductModel product) {
    if (isFavorite(product.id)) {
      favoriteProducts.remove(product.id);
    } else {
      favoriteProducts.add(product.id);
    }
  }

  List<ProductModel> get filteredProducts {
    if (selectedType.value == 'All') {
      return DataDummy.listDummyProducts;
    }
    return DataDummy.listDummyProducts
        .where((product) => product.type == selectedType.value)
        .toList();
  }

  void filterProducts(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(
        allProducts.where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()) ||
            product.description.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }
}
