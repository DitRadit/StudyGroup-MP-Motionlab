import 'package:get/get.dart';
import 'package:home_page/controller/login_controller.dart';

class Loginbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
