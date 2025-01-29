import 'package:get/get.dart';
import 'package:home_page/model/product_model_api.dart';
import 'package:home_page/service/product_service.dart';

class ProductApiController extends GetxController {
  String selectedCategory = 'All';
  var product = Product().obs;
  var categories = <String>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
    fetchCategoryList();
  }

  void fetchProduct() async {
    product.value = await ProductService().getProducts() ?? Product();
    isLoading.value = false;
  }

  void fetchProductsByCategory(String category) async {
    try {
      isLoading.value = true;
      product.value =
          await ProductService().getProductsByCategory(category) ?? Product();
    } catch (e) {
      print("Error fetching products by category: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void fetchCategoryList() async {
    try {
      isLoading.value = true;
      categories.value = await ProductService().getCategoryList() ?? [];
    } catch (e) {
      print("Error fetching category list: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
