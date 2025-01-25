import 'package:get/get.dart';
import '../model/product_model_api.dart';

import '../service/product_service.dart';

class DetailProductController extends GetxController {
  var id;
  var detailProduct = ProductElement().obs;
  var isLoading = true.obs;
  var errorMessage =
      ''.obs; // Menambahkan variabel untuk menampilkan pesan kesalahan

  @override
  onInit() {
    id = Get.arguments?['id']; // Memastikan id valid
    if (id != null) {
      fetchDetailProduct();
    } else {
      errorMessage.value = 'Product ID is null';
      isLoading.value = false; // Mengubah status loading menjadi false
    }
    super.onInit();
  }

  void fetchDetailProduct() async {
    try {
      // Cek apakah id valid sebelum mengakses API
      if (id != null) {
        detailProduct.value =
            await ProductService().getDetailsProducts(id: id) ??
                ProductElement();
        if (detailProduct.value.id == null) {
          errorMessage.value = 'Product not found';
        }
      } else {
        errorMessage.value = 'Invalid Product ID';
      }
    } catch (e) {
      errorMessage.value = 'Error fetching product details: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
