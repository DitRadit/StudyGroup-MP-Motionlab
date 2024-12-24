import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.text = "";
    passwordController.text = "";
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
