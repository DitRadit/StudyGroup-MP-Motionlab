import 'package:get/get.dart';
import 'package:home_page/controller/login_controller.dart';

class Profilebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
