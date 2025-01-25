import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/controller/detailProductApiController.dart';
import 'package:home_page/detail.dart';
import 'package:home_page/pages/cart_page.dart';
import 'package:home_page/pages/home_page.dart';
import 'package:home_page/pages/login_page.dart';
import 'package:home_page/pages/register_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const LoginPage()),
        // GetPage(name: '/cartPage', page: () => const CartPage()),
        GetPage(name: '/register', page: () => const RegisterPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(
          name: '/detailProduct',
          page: () => DetailProduct(),
          binding: BindingsBuilder(() {
            // Ini untuk menginisialisasi controller atau dependensi yang dibutuhkan di halaman ini
            Get.lazyPut(() => DetailProductController());
          }),
        )
      ],
    );
  }
}
