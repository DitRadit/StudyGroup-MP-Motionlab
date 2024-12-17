import 'package:flutter/material.dart';
import 'package:home_page/pages/cart_page.dart';
import 'package:home_page/pages/home_page.dart';
import 'package:home_page/widgets/appbar_widget.dart';

void main() {
  runApp(const DetailProduct());
}

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key});

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
                          "assets/images/Group 1681.png",
                          width: double.infinity,
                          height: 401,
                          // fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Mi Band 8 Pro",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "\$54.00",
                          style:
                              TextStyle(fontSize: 20, color: Color(0xFF00623B)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
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


//  Align(
//                 alignment: Alignment.center,
//                 child: Text("Mi Band 8 Pro",
//                     style: TextStyle(
//                       fontSize: 30,
//                     )),
//               ),