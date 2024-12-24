import 'package:flutter/material.dart';
import 'package:home_page/model/product_model.dart';
import 'package:home_page/pages/cart_page.dart';
import 'package:home_page/pages/home_page.dart';
import 'package:home_page/widgets/appbar_widget.dart';

// Define a model class for product (if not already defined)
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

  const DetailProduct({Key? key, required this.product}) : super(key: key);

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
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
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
      ),
    );
  }
}
