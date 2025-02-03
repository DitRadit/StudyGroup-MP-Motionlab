import 'package:get/get.dart';
import 'package:home_page/model/product_model_api.dart';
import 'package:home_page/service/product_service.dart';

class ProductApiController extends GetxController {
  var selectedCategory = ''.obs;
  var product = Product().obs;
  var categories = <String>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategoryList();
    fetchProduct();
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
