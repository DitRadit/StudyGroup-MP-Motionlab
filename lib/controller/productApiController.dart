import 'package:get/get.dart';
import 'package:home_page/model/product_model_api.dart';
import 'package:home_page/service/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProductApiController extends GetxController {
  var selectedCategory = ''.obs;
  var product = Product().obs;
  var categories = <String>[].obs;
  var isLoading = true.obs;
  List<ProductElement> favoriteProducts = []; // List of favorite products

  @override
  void onInit() {
    super.onInit();
    fetchCategoryList();
    fetchProduct();
    loadFavoriteProducts();
  }

// Fungsi untuk menambahkan produk ke favorit
  Future<void> addFavorite(ProductElement productElement) async {
    if (!favoriteProducts
        .any((favoriteProduct) => favoriteProduct.id == productElement.id)) {
      favoriteProducts.add(productElement);
      await saveFavoriteProducts();
    }
    update();
  }

  // Fungsi untuk menghapus produk dari daftar favorit
  Future<void> removeFavorite(ProductElement productElement) async {
    favoriteProducts.removeWhere(
        (favoriteProduct) => favoriteProduct.id == productElement.id);
    await saveFavoriteProducts();
    update();
  }

  // Fungsi untuk menyimpan daftar produk favorit ke SharedPreferences
  Future<void> saveFavoriteProducts() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> encodedProducts = favoriteProducts
        .map((product) => jsonEncode(product.toJson()))
        .toList();
    await prefs.setStringList('favorite_products', encodedProducts);
  }

  // Fungsi untuk memuat produk favorit dari SharedPreferences
  Future<void> loadFavoriteProducts() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? encodedProducts = prefs.getStringList('favorite_products');
    if (encodedProducts != null) {
      favoriteProducts = encodedProducts
          .map((product) => ProductElement.fromJson(jsonDecode(product)))
          .toList();
    }
    update(); // Update UI setelah memuat data
  }

  // Fetch Products
  void fetchProduct() async {
    try {
      isLoading.value = true;
      print("Fetching products...");
      product.value = await ProductService().getProducts() ?? Product();
      print("Fetched products: ${product.value.products}");
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch Products by Category
  void fetchProductsByCategory(String category) async {
    selectedCategory.value = category;
    update();
    try {
      isLoading.value = true;
      print("Fetching products for category: $category");
      product.value =
          await ProductService().getProductsByCategory(category) ?? Product();
      print("Fetched products for category: $category");
    } catch (e) {
      print("Error fetching products by category: $e");
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch Categories
  void fetchCategoryList() async {
    try {
      isLoading.value = true;
      categories.value = await ProductService().getCategoryList() ?? [];
      update();
    } catch (e) {
      print("Error fetching category list: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
