import 'package:flutter/material.dart';
import 'package:home_page/pages/login_page.dart';
import 'package:home_page/pages/register_page.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
      // home: Scaffold(
      //   appBar: AppBar(
      //     toolbarHeight: 80,
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     title: Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Image.asset(
      //             "assets/images/hamburgermenu.png",
      //             width: 20,
      //             height: 20,
      //           ),
      //           Image.asset(
      //             "assets/images/logo.png",
      //             width: 50,
      //             height: 50,
      //           ),
      //           const Icon(
      //             Icons.shopping_bag_outlined,
      //             size: 25,
      //             color: Colors.grey,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      //   body: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Column(
      //         children: [
      //           // Row(
      //           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           //   children: [
      //           //     Image.asset(
      //           //       "assets/images/hamburgermenu.png",
      //           //       width: 30,
      //           //       height: 30,
      //           //     ),
      //           //     Image.asset(
      //           //       "assets/images/logo.png",
      //           //       width: 60,
      //           //       height: 60,
      //           //     ),
      //           //     Icon(
      //           //       Icons.shopping_bag_outlined,
      //           //       size: 35,
      //           //       color: Colors.grey,
      //           //     ),
      //           //   ],
      //           // ),
      //           Expanded(
      //             child: SingleChildScrollView(
      //               child: Padding(
      //                 padding: const EdgeInsets.only(top: 50.0),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       "Our way of loving \nyou back",
      //                       style: TextStyle(
      //                         fontSize: 25,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                     const SizedBox(height: 50),
      //                     Container(
      //                       padding: const EdgeInsets.all(10),
      //                       width: double.infinity,
      //                       decoration: BoxDecoration(
      //                         borderRadius: BorderRadius.circular(15),
      //                         color: const Color(0xFF2F2F2F2),
      //                       ),
      //                       child: Row(
      //                         children: [
      //                           const Icon(
      //                             Icons.search,
      //                             size: 30,
      //                             color: Colors.grey,
      //                           ),
      //                           const SizedBox(width: 10),
      //                           Expanded(
      //                             child: TextField(
      //                               decoration: InputDecoration(
      //                                 hintText: 'Search',
      //                                 hintStyle: TextStyle(color: Colors.grey),
      //                                 border: InputBorder.none,
      //                               ),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     const SizedBox(height: 40),
      //                     Row(
      //                       children: [
      //                         Expanded(
      //                           child: SingleChildScrollView(
      //                             scrollDirection: Axis.horizontal,
      //                             child: Row(
      //                               children: [
      //                                 TextButton(
      //                                   onPressed: () {},
      //                                   style: TextButton.styleFrom(
      //                                     padding: EdgeInsets.symmetric(
      //                                         horizontal: 30),
      //                                     backgroundColor:
      //                                         const Color(0xFF00623B),
      //                                     textStyle: TextStyle(
      //                                       fontSize: 16,
      //                                     ),
      //                                   ),
      //                                   child: const Text(
      //                                     'All',
      //                                     style: TextStyle(color: Colors.white),
      //                                   ),
      //                                 ),
      //                                 const SizedBox(width: 20),
      //                                 TextButton(
      //                                   onPressed: () {},
      //                                   style: TextButton.styleFrom(
      //                                     padding: EdgeInsets.symmetric(
      //                                         horizontal: 30),
      //                                     backgroundColor:
      //                                         const Color(0xFF2F2F2F2),
      //                                     textStyle: TextStyle(
      //                                       fontSize: 16,
      //                                     ),
      //                                   ),
      //                                   child: const Text(
      //                                     'Watch',
      //                                     style: TextStyle(color: Colors.black),
      //                                   ),
      //                                 ),
      //                                 const SizedBox(width: 20),
      //                                 TextButton(
      //                                   onPressed: () {},
      //                                   style: TextButton.styleFrom(
      //                                     padding: EdgeInsets.symmetric(
      //                                         horizontal: 30),
      //                                     backgroundColor:
      //                                         const Color(0xFF2F2F2F2),
      //                                     textStyle: TextStyle(
      //                                       fontSize: 16,
      //                                     ),
      //                                   ),
      //                                   child: const Text(
      //                                     'Shirt',
      //                                     style: TextStyle(color: Colors.black),
      //                                   ),
      //                                 ),
      //                                 const SizedBox(width: 20),
      //                                 TextButton(
      //                                   onPressed: () {},
      //                                   style: TextButton.styleFrom(
      //                                     padding: EdgeInsets.symmetric(
      //                                         horizontal: 30),
      //                                     backgroundColor:
      //                                         const Color(0xFF2F2F2F2),
      //                                     textStyle: TextStyle(
      //                                       fontSize: 16,
      //                                     ),
      //                                   ),
      //                                   child: const Text(
      //                                     'Shoes',
      //                                     style: TextStyle(color: Colors.black),
      //                                   ),
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     const SizedBox(height: 30),
      //                     SingleChildScrollView(
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text(
      //                             "Our Best Seller",
      //                             style: TextStyle(
      //                               fontSize: 25,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                           const SizedBox(height: 30),
      //                           GridView.count(
      //                             shrinkWrap: true,
      //                             childAspectRatio: (itemWidth / itemHeight),
      //                             physics: NeverScrollableScrollPhysics(),
      //                             crossAxisCount: 2,
      //                             crossAxisSpacing: 10,
      //                             mainAxisSpacing: 10,
      //                             padding: const EdgeInsets.all(20),
      //                             children: <Widget>[
      //                               Container(
      //                                 width: double.infinity,
      //                                 height: 180,
      //                                 decoration: BoxDecoration(
      //                                   color: Colors.white,
      //                                   borderRadius: BorderRadius.circular(10),
      //                                   boxShadow: [
      //                                     BoxShadow(
      //                                       color: Colors.black26,
      //                                       blurRadius: 5,
      //                                       offset: Offset(0, 2),
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 child: Column(
      //                                   children: [
      //                                     ClipRRect(
      //                                       borderRadius:
      //                                           BorderRadius.circular(8),
      //                                       child: Image.asset(
      //                                         'assets/images/smartwatch.png',
      //                                         fit: BoxFit.cover,
      //                                         width: double.infinity,
      //                                         height: 180,
      //                                       ),
      //                                     ),
      //                                     Padding(
      //                                       padding: const EdgeInsets.all(8.0),
      //                                       child: Column(
      //                                         crossAxisAlignment:
      //                                             CrossAxisAlignment.start,
      //                                         children: [
      //                                           Row(
      //                                             mainAxisAlignment:
      //                                                 MainAxisAlignment
      //                                                     .spaceBetween,
      //                                             children: [
      //                                               Text(
      //                                                 'Mi Band 8 Pro',
      //                                                 style: TextStyle(
      //                                                   fontSize: 13,
      //                                                 ),
      //                                               ),
      //                                             ],
      //                                           ),
      //                                           SizedBox(height: 8),
      //                                           Row(
      //                                             mainAxisAlignment:
      //                                                 MainAxisAlignment
      //                                                     .spaceAround,
      //                                             children: [
      //                                               Text(
      //                                                 '\$54.00',
      //                                                 style: TextStyle(
      //                                                   fontSize: 16,
      //                                                   color: Colors.green,
      //                                                 ),
      //                                               ),
      //                                               SizedBox(width: 60),
      //                                               Icon(Icons.favorite,
      //                                                   color: Colors.red),
      //                                             ],
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ),
      //                               Container(
      //                                 width: double.infinity,
      //                                 height: 180,
      //                                 decoration: BoxDecoration(
      //                                   color: Colors.white,
      //                                   borderRadius: BorderRadius.circular(10),
      //                                   boxShadow: [
      //                                     BoxShadow(
      //                                       color: Colors.black26,
      //                                       blurRadius: 5,
      //                                       offset: Offset(0, 2),
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 child: Column(
      //                                   children: [
      //                                     ClipRRect(
      //                                       borderRadius:
      //                                           BorderRadius.circular(8),
      //                                       child: Image.asset(
      //                                         'assets/images/baju.png',
      //                                         fit: BoxFit.cover,
      //                                         width: double.infinity,
      //                                         height: 180,
      //                                       ),
      //                                     ),
      //                                     Padding(
      //                                       padding: const EdgeInsets.all(8.0),
      //                                       child: Column(
      //                                         crossAxisAlignment:
      //                                             CrossAxisAlignment.start,
      //                                         children: [
      //                                           Row(
      //                                             mainAxisAlignment:
      //                                                 MainAxisAlignment
      //                                                     .spaceBetween,
      //                                             children: [
      //                                               Text(
      //                                                 'Lycra Men’s shirt',
      //                                                 style: TextStyle(
      //                                                   fontSize: 13,
      //                                                 ),
      //                                               ),
      //                                             ],
      //                                           ),
      //                                           SizedBox(height: 8),
      //                                           Row(
      //                                             mainAxisAlignment:
      //                                                 MainAxisAlignment
      //                                                     .spaceAround,
      //                                             children: [
      //                                               Text(
      //                                                 '\$12.00',
      //                                                 style: TextStyle(
      //                                                   fontSize: 16,
      //                                                   color: Colors.green,
      //                                                 ),
      //                                               ),
      //                                               SizedBox(width: 60),
      //                                               Icon(Icons.favorite,
      //                                                   color: Colors.grey),
      //                                             ],
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ),
      //                               Container(
      //                                 width: double.infinity,
      //                                 height: 180,
      //                                 decoration: BoxDecoration(
      //                                   color: Colors.white,
      //                                   borderRadius: BorderRadius.circular(10),
      //                                   boxShadow: [
      //                                     BoxShadow(
      //                                       color: Colors.black26,
      //                                       blurRadius: 5,
      //                                       offset: Offset(0, 2),
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 child: Column(
      //                                   children: [
      //                                     ClipRRect(
      //                                       borderRadius:
      //                                           BorderRadius.circular(8),
      //                                       child: Image.asset(
      //                                         'assets/images/headphone.png',
      //                                         fit: BoxFit.cover,
      //                                         width: double.infinity,
      //                                         height: 180,
      //                                       ),
      //                                     ),
      //                                     Padding(
      //                                       padding: const EdgeInsets.all(8.0),
      //                                       child: Column(
      //                                         crossAxisAlignment:
      //                                             CrossAxisAlignment.start,
      //                                         children: [
      //                                           Row(
      //                                             mainAxisAlignment:
      //                                                 MainAxisAlignment
      //                                                     .spaceBetween,
      //                                             children: [
      //                                               Text(
      //                                                 'Siberia 800',
      //                                                 style: TextStyle(
      //                                                   fontSize: 13,
      //                                                 ),
      //                                               ),
      //                                             ],
      //                                           ),
      //                                           SizedBox(height: 8),
      //                                           Row(
      //                                             mainAxisAlignment:
      //                                                 MainAxisAlignment
      //                                                     .spaceAround,
      //                                             children: [
      //                                               Text(
      //                                                 '\$45.00',
      //                                                 style: TextStyle(
      //                                                   fontSize: 16,
      //                                                   color: Colors.green,
      //                                                 ),
      //                                               ),
      //                                               SizedBox(width: 60),
      //                                               Icon(Icons.favorite,
      //                                                   color: Colors.grey),
      //                                             ],
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ),
      //                               Container(
      //                                 width: double.infinity,
      //                                 height: 180,
      //                                 decoration: BoxDecoration(
      //                                   color: Colors.white,
      //                                   borderRadius: BorderRadius.circular(10),
      //                                   boxShadow: [
      //                                     BoxShadow(
      //                                       color: Colors.black26,
      //                                       blurRadius: 5,
      //                                       offset: Offset(0, 2),
      //                                     ),
      //                                   ],
      //                                 ),
      //                                 child: Column(
      //                                   children: [
      //                                     ClipRRect(
      //                                       borderRadius:
      //                                           BorderRadius.circular(8),
      //                                       child: Image.asset(
      //                                         'assets/images/shoes.png',
      //                                         fit: BoxFit.cover,
      //                                         width: double.infinity,
      //                                         height: 180,
      //                                       ),
      //                                     ),
      //                                     Padding(
      //                                       padding: const EdgeInsets.all(8.0),
      //                                       child: Column(
      //                                         crossAxisAlignment:
      //                                             CrossAxisAlignment.start,
      //                                         children: [
      //                                           Row(
      //                                             mainAxisAlignment:
      //                                                 MainAxisAlignment
      //                                                     .spaceBetween,
      //                                             children: [
      //                                               Text(
      //                                                 'Strawberry Frappuccino',
      //                                                 style: TextStyle(
      //                                                   fontSize: 13,
      //                                                 ),
      //                                               ),
      //                                             ],
      //                                           ),
      //                                           SizedBox(height: 8),
      //                                           Row(
      //                                             mainAxisAlignment:
      //                                                 MainAxisAlignment
      //                                                     .spaceAround,
      //                                             children: [
      //                                               Text(
      //                                                 '\$35.00',
      //                                                 style: TextStyle(
      //                                                   fontSize: 16,
      //                                                   color: Colors.green,
      //                                                 ),
      //                                               ),
      //                                               SizedBox(width: 60),
      //                                               Icon(Icons.favorite,
      //                                                   color: Colors.grey),
      //                                             ],
      //                                           ),
      //                                         ],
      //                                       ),
      //                                     ),
      //                                   ],
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ],
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      //   bottomNavigationBar: Container(
      //     padding: EdgeInsets.all(20),
      //     width: double.infinity,
      //     decoration: BoxDecoration(
      //       color: Color(0xFF00623B),
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Icon(
      //           Icons.home,
      //           size: 30,
      //           color: Colors.white,
      //         ),
      //         Icon(
      //           Icons.account_balance_wallet_outlined,
      //           size: 30,
      //           color: Colors.grey,
      //         ),
      //         Icon(
      //           Icons.favorite_outline,
      //           size: 30,
      //           color: Colors.grey,
      //         ),
      //         Icon(
      //           Icons.notifications_none_outlined,
      //           size: 30,
      //           color: Colors.grey,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
