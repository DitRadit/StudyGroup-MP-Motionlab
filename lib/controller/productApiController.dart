import 'package:get/get.dart';
import 'package:home_page/model/product_model_api.dart';
import 'package:home_page/service/product_service.dart';

class ProductApiController extends GetxController {
  String selectedCategory = 'All';
  var product = Product().obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    product.value = await ProductService().getProducts() ?? Product();
    isLoading.value = false;
  }
}
