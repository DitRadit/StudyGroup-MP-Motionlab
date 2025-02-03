import 'package:get/get.dart';
import 'package:home_page/controller/detailProductApiController.dart';

class DetailProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProductController>(
      () => DetailProductController(),
    );
  }
}
