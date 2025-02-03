import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/controller/cart_controller.dart';
import 'package:home_page/controller/detailProductApiController.dart';
import 'package:home_page/controller/productApiController.dart';
// import 'package:home_page/controller/product_controller.dart';
import 'package:home_page/model/product_model_api.dart';
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
  final DetailProductController detailController =
      Get.put(DetailProductController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              NavBar(
                text: "Product",
                routeName: HomePage(),
                actions: [],
              ),
              Expanded(
                child: Obx(() {
                  if (detailController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (detailController.errorMessage.isNotEmpty) {
                    return Center(
                        child: Text(detailController.errorMessage.value));
                  }

                  // Jika produk berhasil dimuat
                  final product = detailController.detailProduct.value;
                  if (product.id == null) {
                    return Center(child: Text('Product not found.'));
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Image.network(
                          (product.images?.isNotEmpty == true &&
                                  product.images![0].isNotEmpty)
                              ? product.images![0]
                              : 'https://via.placeholder.com/150',
                          width: double.infinity,
                          height: 401,
                        ),
                        SizedBox(height: 15),
                        Text(
                          product.title ?? 'Unknown Product',
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "\$${product.price?.toStringAsFixed(2) ?? '0.00'}",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFF00623B)),
                        ),
                        SizedBox(height: 15),
                        Text(
                          product.description ?? 'No description available',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(height: 15),
              GestureDetector(
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
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
