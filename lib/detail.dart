import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/controller/cart_controller.dart';
import 'package:home_page/controller/productApiController.dart';
import 'package:home_page/controller/product_controller.dart';
import 'package:home_page/model/product_model_api.dart';
import 'package:home_page/pages/cart_page.dart';
import 'package:home_page/pages/home_page.dart';
import 'package:home_page/widgets/appbar_widget.dart';

class DetailProduct extends StatelessWidget {
  final int productId;
  final ProductElement product;
  final ProductController productController = Get.put(ProductController());
  final ProductApiController productApiController =
      Get.put(ProductApiController());
  final CartController cartController = Get.put(CartController());

  DetailProduct({Key? key, required this.product, required this.productId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    productApiController.fetchSingleProduct(productId); 
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
                child: Obx(() {
                  if (productApiController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Image.network(
                          product.images[0], 
                          width: double.infinity,
                          height: 401,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          product.title,
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
                  );
                }),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
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
            ],
          ),
        ),
      ),
    );
  }
}
