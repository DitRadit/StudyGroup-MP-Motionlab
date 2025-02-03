import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final int quantity;
  final Function quantityIncrement;
  final Function quantityDecrement;

  ProductCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
    required this.quantityIncrement,
    required this.quantityDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 127,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 1,
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageUrl,
                      width: 92,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style:
                                TextStyle(fontFamily: 'Roboto', fontSize: 14),
                          ),
                          SizedBox(height: 10),
                          Text(
                            price,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Color(0xFF00623B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFF00623B),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => quantityDecrement(),
                          icon: Icon(
                            Icons.remove,
                            color: Color(0xFF00623B),
                            size: 13,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                            quantity.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => quantityIncrement(),
                          icon: Icon(
                            Icons.add,
                            color: Color(0xFF00623B),
                            size: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
