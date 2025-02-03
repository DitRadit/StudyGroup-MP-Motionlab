import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:home_page/controller/detailProductApiController.dart';
// import 'package:home_page/pages/detail.dart';
// import 'package:home_page/pages/cart_page.dart';
// import 'package:home_page/pages/home_page.dart';
// import 'package:home_page/pages/login_page.dart';
// import 'package:home_page/pages/register_page.dart';
import 'package:home_page/routes/appPages.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
