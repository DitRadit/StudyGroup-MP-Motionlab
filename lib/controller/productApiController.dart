import 'package:get/get.dart';
import 'package:home_page/service/product_service.dart';
import 'package:home_page/model/product_model_api.dart';

class ProductApiController extends GetxController {
  final isLoading = false.obs;
  final products = Rxn<List<Product>>(); // Menampung daftar produk
  final product =
      Rxn<Product>(null); // Menampung produk tunggal (misalnya detail produk)
  final categories = Rxn<List<String>>(); // Menampung kategori produk
  final errorMessage = ''.obs;
  var selectedType = 'All'.obs;

  // Instance service
  final ProductService _productService = ProductService();

  // Fetch All Products
  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      final productList = await _productService.getProducts();
      if (productList != null) {
        products.value = productList; // Menyimpan daftar produk
      } else {
        errorMessage.value = "No products found";
      }
    } catch (e) {
      errorMessage.value = "Failed to fetch products: $e";
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch All Products By Category
  Future<void> fetchProductsByCategory(String category) async {
    isLoading.value = true;
    try {
      final productList = await _productService.getProductsByCategory(category);
      if (productList != null) {
        products.value =
            productList; 
      } else {
        errorMessage.value = "No products found for the category";
      }
    } catch (e) {
      errorMessage.value = "Failed to fetch products: $e";
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch Category List
  Future<void> fetchCategoryList() async {
    isLoading.value = true;
    try {
      final categoryList = await _productService.getCategoryList();
      if (categoryList != null) {
        categories.value = categoryList; 
      } else {
        errorMessage.value = "No categories found";
      }
    } catch (e) {
      errorMessage.value = "Failed to fetch categories: $e";
    } finally {
      isLoading.value = false;
    }
  }

  // Fetch Single Product by ID
  Future<void> fetchSingleProduct(int id) async {
    isLoading.value = true;
    try {
      final productDetails = await _productService.getSingleProduct(id);
      if (productDetails != null) {
        product.value = productDetails; 
      } else {
        errorMessage.value = "Product not found";
      }
    } catch (e) {
      errorMessage.value = "Failed to fetch product details: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
