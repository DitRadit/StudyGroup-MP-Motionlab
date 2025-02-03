import 'package:get/get.dart';
import 'package:home_page/bindings/detailProductBinding.dart';
import 'package:home_page/bindings/loginBinding.dart';
import 'package:home_page/bindings/productHomeBindings.dart';
import 'package:home_page/bindings/registerBinding.dart';
import 'package:home_page/pages/detail.dart';
import 'package:home_page/pages/home_page.dart';
import 'package:home_page/pages/login_page.dart';
import 'package:home_page/pages/register_page.dart';

part 'appRoutes.dart';

class AppPages {
  AppPages._();

  // Initial route
  static const INITIAL = _Paths.LOGIN;

  // Application routes
  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginPage(),
      binding: Loginbinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: ProductApiBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT,
      page: () => DetailProduct(),
      binding: DetailProductBinding(),
    ),
  ];
}
