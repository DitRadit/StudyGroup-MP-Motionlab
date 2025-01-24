import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/controller/productApiController.dart';
import 'package:home_page/controller/product_controller.dart';
import 'package:home_page/detail.dart';
import 'package:home_page/model/product_model.dart';
import 'package:home_page/model/product_model_api.dart';
// import 'package:home_page/detail.dart';
import 'package:home_page/pages/cart_page.dart';
import 'package:home_page/utils/product_dummy.dart';
import 'package:home_page/widgets/gallery_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    final ProductApiController productApiController =
        Get.put(ProductApiController());

    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;

    productApiController.fetchCategoryList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/hamburgermenu.png",
                  width: 20,
                  height: 20,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  width: 50,
                  height: 50,
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CartPage())),
                  icon: Icon(Icons.shopping_bag_outlined),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Our way of loving \nyou back",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 50),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF2F2F2F2),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          Obx(() {
                            if (productController.isLoading.value) {
                              return CircularProgressIndicator(); 
                            }

                            return Row(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: productApiController
                                          .categories.value!
                                          .map((category) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextButton(
                                            onPressed: () {
                                              productApiController
                                                  .fetchProductsByCategory(
                                                      category);
                                              productApiController.selectedType
                                                  .value = category;
                                            },
                                            style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30),
                                              backgroundColor:
                                                  productApiController
                                                              .selectedType
                                                              .value ==
                                                          category
                                                      ? const Color(0xFF00623B)
                                                      : Colors.grey.shade300,
                                            ),
                                            child: Text(
                                              category,
                                              style: TextStyle(
                                                color: productController
                                                            .selectedType
                                                            .value ==
                                                        category
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                          const SizedBox(height: 30),
                          // Product Section
                          Obx(() {
                            if (productApiController.isLoading.value) {
                              return CircularProgressIndicator(); 
                            }

                            if (productApiController.errorMessage.isNotEmpty) {
                              return Center(
                                  child: Text(productApiController.errorMessage
                                      .value)); 
                            }

                            List<ProductElement> displayedProducts =
                                (productApiController.products.value
                                    as List<ProductElement>);

                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Our Best Seller",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  GridView.builder(
                                    padding: const EdgeInsets.all(10),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 0.8,
                                    ),
                                    itemCount: displayedProducts.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final product = displayedProducts[index];
                                      return GalleryCardWidget(
                                        product: product,
                                        imagePath: product.images.isNotEmpty
                                            ? product.images[0]
                                            : '',
                                        title: product.title,
                                        price:
                                            '\$${product.price.toStringAsFixed(2)}',
                                        icon: Icons.favorite,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF00623B),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Obx(() {
                return IconButton(
                  icon: Icon(
                    productController.showFavoritesOnly.value
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    size: 30,
                    color: productController.showFavoritesOnly.value
                        ? Colors.red
                        : Colors.grey,
                  ),
                  onPressed: () {
                    productController.showFavoritesOnly.toggle();
                  },
                );
              }),
              Icon(
                Icons.person_2_outlined,
                size: 30,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
