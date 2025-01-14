import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_page/controller/product_controller.dart';
import 'package:home_page/model/product_model.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Widget? routeName;
  final Widget? icon;
  final ProductModel? product;
  final List<Widget> actions;

  const NavBar(
      {super.key,
      this.routeName,
      required this.text,
      this.icon,
      this.product,
      this.actions = const []});

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.put(ProductController());

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
              if (routeName != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => routeName!),
                );
              }
            },
          ),
        ),
        title: Text(
          text,
          style: GoogleFonts.roboto(
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
        actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
