import 'package:get/get.dart';

class CartController extends GetxController {
  final quantity = 0.obs;
  void quantityIncrement() => quantity.value++;
  void quantityDecrement() => quantity.value--;
}
