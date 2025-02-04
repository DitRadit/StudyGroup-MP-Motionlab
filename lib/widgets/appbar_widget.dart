import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:home_page/controller/product_controller.dart';
import 'package:home_page/model/product_model.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Widget? icon;
  final ProductModel? product;
  final Widget? rightWidget;

  const NavBar({
    super.key,
    required this.text,
    this.icon,
    this.product,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    // final favoriteController = Get.put(ProductController());

    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: IconButton(
          icon: Image.asset(
            "assets/images/arrow.png",
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 56,
      toolbarHeight: kToolbarHeight,
      actions: rightWidget != null ? [rightWidget!] : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
