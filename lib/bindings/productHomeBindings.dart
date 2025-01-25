import 'package:get/get.dart';

import '../controller/productApiController.dart';

class ProductApiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductApiController>(
      () => ProductApiController(),
    );
  }
}
