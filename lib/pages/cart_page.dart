import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_page/controller/cart_controller.dart';
import 'package:home_page/pages/home_page.dart';
import 'package:home_page/pages/invoice_page.dart';
// import 'package:home_page/utils/product_dummy.dart';
import 'package:home_page/widgets/appbar_widget.dart';
import 'package:home_page/widgets/custom_big_button.dart';
import 'package:home_page/widgets/product_card_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return Obx(() {
      return Scaffold(
        appBar: NavBar(
          text: "My Cart",
          routeName: HomePage(),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: cartController.cartProducts.map((product) {
                    final productQuantity =
                        cartController.getQuantity(product.id);

                    return ProductCard(
                      imageUrl:
                          product.images.isNotEmpty ? product.images[0] : '',
                      title: product.title,
                      price: '\$${product.price.toStringAsFixed(2)}',
                      quantity: productQuantity,
                      quantityIncrement: () =>
                          cartController.incrementQuantity(product.id),
                      quantityDecrement: () =>
                          cartController.decrementQuantity(product.id),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: CustomBigButton(
                text: "Buy",
                routeName: InvoicePage(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
