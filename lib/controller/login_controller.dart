import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/main.dart';
import 'package:home_page/model/user_model.dart';
import '../constant/constant.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<UserModel?> login() async {
    isLoading.value = true;
    update();
    try {
      final response = await dio.post(
        '$url/auth/login',
        data: {
          "username": usernameController.text.trim(),
          "password": passwordController.text.trim(),
        },
      );
      if (response.statusCode == 200) {
        final data = UserModel.fromJson(response.data);
        Get.snackbar('Success', 'Welcome, ${data.firstName} ');
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Error', 'Failed Login');
      }
    } on DioException catch (error) {
      Get.snackbar('Error', error.message!);
    } catch (error) {
      Get.snackbar('Error', error.toString());
    } finally {
      isLoading.value = false;
      update();
    }
  }
}
