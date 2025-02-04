import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:home_page/main.dart';
import 'package:home_page/model/user_model.dart';
import 'package:home_page/routes/appPages.dart';
import '../constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt('id', data.id);
        await prefs.setString('username', data.username);
        await prefs.setString('firstName', data.firstName);
        await prefs.setString('lastName', data.lastName);
        await prefs.setBool('isLoggedIn', true);
        Get.snackbar('Success', 'Welcome, ${data.firstName}');
        Get.offAllNamed(Routes.HOME);
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

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('id');
    await prefs.remove('username');
    await prefs.remove('firstName');
    await prefs.remove('lastName');
    await prefs.remove('isLoggedIn');
    Get.snackbar('Success', 'You have logged out');
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<Map<String, String>> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final id = (prefs.getInt('id') ?? 0).toString();
    String? username = prefs.getString('username') ?? 'N/A';
    String? firstName = prefs.getString('firstName') ?? 'N/A';
    String? lastName = prefs.getString('lastName') ?? 'N/A';

    return {
      'id': id,
      'Username': username,
      'First Name': firstName,
      'Last Name': lastName,
    };
  }
}


  // late Box<UserModel> userBox;

  // @override
  // void onInit() {
  //   super.onInit();
  //   openHiveBox().then((_) => checkCurrentUser());
  // }

  // Future<void> openHiveBox() async {
  //   userBox = await Hive.openBox<UserModel>('userBox');
  // }

  // Future<void> checkCurrentUser() async {
  //   final currentUser = userBox.get('currentUser');
  //   if (currentUser != null) {
  //     Get.offAllNamed(Routes.HOME);
  //   }
  // }


    // Future<void> logout() async {
  //   await userBox.delete('currentUser');
  //   Get.offAllNamed(Routes.LOGIN);
  //   Get.snackbar('Logged out', 'You have been logged out.');
  // }