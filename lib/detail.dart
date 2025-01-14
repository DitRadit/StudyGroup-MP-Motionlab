import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/controller/cart_controller.dart';
import 'package:home_page/controller/product_controller.dart';
import 'package:home_page/model/product_model.dart';
import 'package:home_page/pages/cart_page.dart';
import 'package:home_page/pages/home_page.dart';
import 'package:home_page/widgets/appbar_widget.dart';

class Product {
  final String name;
  final String image;
  final String description;
  final double price;

  Product({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}

class DetailProduct extends StatelessWidget {
  final ProductModel product;
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());

  DetailProduct({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                NavBar(
                  text: "Product",
                  routeName: HomePage(),
                  actions: [
                    Obx(() {
                      return IconButton(
                        icon: Icon(
                          productController.isFavorite(product.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: productController.isFavorite(product.id)
                              ? Colors.red
                              : Colors.grey,
                        ),
                        onPressed: () {
                          productController.toggleFavorite(product);
                        },
                      );
                    }),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Image.asset(
                          product.image,
                          width: double.infinity,
                          height: 401,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "\$${product.price}",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFF00623B)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      cartController.addToCart(product); 
                      Get.to(CartPage());
                    },
                    child: Container(
                      padding: EdgeInsets.all(30),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF00623B),
                      ),
                      child: Text(
                        "Add To Bag",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
