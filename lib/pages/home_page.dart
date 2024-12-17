import 'package:flutter/material.dart';
import 'package:home_page/detail.dart';
// import 'package:home_page/detail.dart';
import 'package:home_page/pages/cart_page.dart';
import 'package:home_page/widgets/gallery_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;

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
                          Row(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          backgroundColor:
                                              const Color(0xFF00623B),
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        child: const Text(
                                          'All',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          backgroundColor:
                                              const Color(0xFF2F2F2F2),
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        child: const Text(
                                          'Watch',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          backgroundColor:
                                              const Color(0xFF2F2F2F2),
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        child: const Text(
                                          'Shirt',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          backgroundColor:
                                              const Color(0xFF2F2F2F2),
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        child: const Text(
                                          'Shoes',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
                                GridView(
                                  padding: EdgeInsets.all(10),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 0.7,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailProduct(),
                                          ),
                                        );
                                      },
                                      child: GalleryCardWidget(
                                        imagePath:
                                            "assets/images/smartwatch.png",
                                        title: "Mi Band 8 Pro",
                                        price: "\$54.00",
                                        icon: Icons.favorite,
                                        iconColor: Colors.red,
                                      ),
                                    ),
                                    GalleryCardWidget(
                                      imagePath: "assets/images/baju.png",
                                      title: "Lycra Men’s shirt",
                                      price: "\$12.00",
                                      icon: Icons.favorite,
                                      iconColor: Colors.grey,
                                    ),
                                    GalleryCardWidget(
                                      imagePath: "assets/images/baju.png",
                                      title: "Lycra Men’s shirt",
                                      price: "\$12.00",
                                      icon: Icons.favorite,
                                      iconColor: Colors.grey,
                                    ),
                                    GalleryCardWidget(
                                      imagePath: "assets/images/baju.png",
                                      title: "Lycra Men’s shirt",
                                      price: "\$12.00",
                                      icon: Icons.favorite,
                                      iconColor: Colors.grey,
                                    ),
                                  ],
                                ),
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
              Icon(
                Icons.favorite_outline,
                size: 30,
                color: Colors.grey,
              ),
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
