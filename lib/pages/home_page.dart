import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/controller/productApiController.dart';
// import 'package:home_page/controller/product_controller.dart';
// import 'package:home_page/pages/detail.dart';
// import 'package:home_page/model/product_model.dart';
// import 'package:home_page/pages/cart_page.dart';
import 'package:home_page/routes/appPages.dart';
// import 'package:home_page/utils/product_dummy.dart';
import 'package:home_page/widgets/gallery_card_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductApiController productApiController =
        Get.put(ProductApiController()); // Mengambil controller
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
                // IconButton(
                //   onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                //       builder: (context) => const CartPage())),
                //   icon: Icon(Icons.shopping_bag_outlined),
                // ),
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
                          Row(
                            children: [
                              Expanded(
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Obx(() {
                                            if (productApiController
                                                .categories.isEmpty) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }

                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: List.generate(
                                                    productApiController
                                                        .categories
                                                        .length, (index) {
                                                  String category =
                                                      productApiController
                                                          .categories[index];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        productApiController
                                                            .selectedCategory
                                                            .value = category;
                                                        productApiController
                                                            .fetchProductsByCategory(
                                                                category);
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 30),
                                                        backgroundColor:
                                                            productApiController
                                                                        .selectedCategory
                                                                        .value ==
                                                                    category
                                                                ? const Color(
                                                                    0xFF00623B)
                                                                : Colors.grey
                                                                    .shade300,
                                                      ),
                                                      child: Text(
                                                        category,
                                                        style: TextStyle(
                                                          color: productApiController
                                                                      .selectedCategory
                                                                      .value ==
                                                                  category
                                                              ? Colors.white
                                                              : Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            );
                                          })
                                        ],
                                      ))),
                            ],
                          ),
                          const SizedBox(height: 30),
                          SingleChildScrollView(
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
                                Obx(() {
                                  if (productApiController.isLoading.value) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }

                                  final products = productApiController
                                          .product.value.products ??
                                      [];

                                  if (products.isEmpty) {
                                    return const Center(
                                        child: Text('No products available.'));
                                  }

                                  return GridView.builder(
                                    padding: const EdgeInsets.all(10),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 0.6,
                                    ),
                                    itemCount: products.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final product = products[index];
                                      bool isFavorite = productApiController
                                          .favoriteProducts
                                          .any((favoriteProduct) =>
                                              favoriteProduct.id == product.id);

                                      return GestureDetector(
                                        onTap: () {
                                          if (product.id != null) {
                                            Get.toNamed(Routes.DETAIL_PRODUCT,
                                                arguments: {'id': product.id});
                                          } else {
                                            print('Product ID is null');
                                          }
                                        },
                                        child: GalleryCardWidget(
                                          imagePath: product.thumbnail ??
                                              'https://via.placeholder.com/150',
                                          title: product.title ??
                                              'Unknown Product',
                                          price:
                                              '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                                          icon: IconButton(
                                            icon: Icon(
                                              isFavorite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: isFavorite
                                                  ? Colors.red
                                                  : Colors.grey,
                                            ),
                                            onPressed: () {
                                              if (isFavorite) {
                                                productApiController
                                                    .removeFavorite(product);
                                              } else {
                                                productApiController
                                                    .addFavorite(product);
                                              }
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                })
                              ],
                            ),
                          )
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
              // Obx(() {
              //   return IconButton(
              //     icon: Icon(
              //       productController.showFavoritesOnly.value
              //           ? Icons.favorite
              //           : Icons.favorite_outline,
              //       size: 30,
              //       color: productController.showFavoritesOnly.value
              //           ? Colors.red
              //           : Colors.grey,
              //     ),
              //     onPressed: () {
              //       productController.showFavoritesOnly.toggle();
              //     },
              //   );
              // }),
              IconButton(
                icon: const Icon(
                  Icons.person_2_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Get.toNamed(Routes.PROFILE);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
