import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:home_page/controller/cart_controller.dart';
import 'package:home_page/pages/home_page.dart';
import 'package:home_page/pages/invoice_page.dart';
import 'package:home_page/widgets/appbar_widget.dart';
import 'package:home_page/widgets/custom_big_button.dart';
import 'package:home_page/widgets/product_card_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Obx(
      () => Scaffold(
        appBar: NavBar(
          text: "MyCart",
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
                children: [
                  ProductCard(
                    imageUrl: "assets/images/smartwatch.png",
                    title: "Mi Band 8 Pro - Brand\nNew",
                    price: "\$54.00",
                    quantity: cartController.quantity.value,
                    quantityIncrement: cartController.quantityIncrement,
                    quantityDecrement: cartController.quantityDecrement,
                  ),
                  ProductCard(
                    imageUrl: "assets/images/baju.png",
                    title: "Lycra Men’s shirt",
                    price: "\$12.00",
                    quantity: cartController.quantity.value,
                    quantityIncrement: cartController.quantityIncrement,
                    quantityDecrement: cartController.quantityDecrement,
                  ),
                ],
              )),
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
      ),
    );
  }
}
