import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_page/controller/productApiController.dart';
import 'package:home_page/controller/product_controller.dart';
import 'package:home_page/detail.dart';
import 'package:home_page/model/product_model_api.dart';

class GalleryCardWidget extends StatelessWidget {
  final ProductElement product;
  final String imagePath;
  final String title;
  final String price;
  final IconData icon;
  final Color iconColor;

  const GalleryCardWidget({
    Key? key,
    required this.product,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.icon,
    this.iconColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    final ProductApiController productApiController =
        Get.put(ProductApiController());

    return GestureDetector(
      onTap: () {
        productApiController.fetchSingleProduct(product.id);

        Get.to(() => DetailProduct(product: product, productId: product.id));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imagePath,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      title,
                      style: GoogleFonts.raleway(fontSize: 14),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: const Color(0xFF00623B),
                        ),
                      ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
