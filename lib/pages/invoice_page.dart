// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:home_page/controller/cart_controller.dart';
// import 'package:home_page/pages/cart_page.dart';
// import 'package:home_page/pages/home_page.dart';
// import 'package:home_page/widgets/appbar_widget.dart';
// import 'package:home_page/widgets/custom_big_button.dart';

// class InvoicePage extends StatelessWidget {
//   const InvoicePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final CartController cartController = Get.put(CartController());
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           top: true,
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 NavBar(
//                   text: "Invoice",
//                   routeName: CartPage(),
//                 ),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: 335,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 1,
//                             color: Color(0x334D4D4D),
//                             offset: Offset(0, 1),
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(6),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(8),
//                               child: Image.asset(
//                                 "assets/images/sukses.png",
//                                 width: 65,
//                                 height: 71,
//                                 fit: BoxFit.contain,
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
//                               child: Text(
//                                 "Transaction Success",
//                                 style: TextStyle(
//                                     color: const Color.fromARGB(214, 0, 0, 0),
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                             ),
//                             Obx(() {
//                               return Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
//                                 child: Text(
//                                   "\$${cartController.calculateTotal().toStringAsFixed(2)}", // Dynamically show the total price
//                                   style: GoogleFonts.roboto(
//                                     color: Colors.black,
//                                     fontSize: 28,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               );
//                             }),
//                             SizedBox(
//                               width: double.infinity,
//                               child: Divider(
//                                 thickness: 1,
//                                 color: const Color.fromARGB(73, 158, 158, 158),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(14),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Invoice Number",
//                                     style: GoogleFonts.roboto(
//                                         color: Color(0x79000000),
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   Text(
//                                     "000085752257",
//                                     style: GoogleFonts.inter(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(14),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Transaction Date",
//                                     style: GoogleFonts.roboto(
//                                         color: Color(0x79000000),
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   Text(
//                                     "16 June 2023",
//                                     style: GoogleFonts.inter(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.all(14),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Payment Method",
//                                     style: GoogleFonts.roboto(
//                                         color: Color(0x79000000),
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   Text(
//                                     "Bank Transfer",
//                                     style: GoogleFonts.inter(
//                                         color: Colors.black,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
//                       child: Container(
//                         width: double.infinity,
//                         height: 188,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           boxShadow: [
//                             BoxShadow(
//                               blurRadius: 1,
//                               color: Color(0x33000000),
//                               offset: Offset(0, 1),
//                             ),
//                           ],
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.all(22),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.max,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Text(
//                                     "Detail Pesanan",
//                                     style: GoogleFonts.roboto(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Order Name",
//                                       style: GoogleFonts.roboto(
//                                         color: Color(0x78000000),
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     Text(
//                                       "Indra Mahesa",
//                                       style: GoogleFonts.inter(
//                                         color: Colors.black,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "Order Email",
//                                       style: GoogleFonts.roboto(
//                                         color: Color(0x78000000),
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     Text(
//                                       "indramahesa@gmail.com",
//                                       style: GoogleFonts.inter(
//                                         color: Colors.black,
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Obx(() {
//                                 final totalPrice =
//                                     cartController.calculateTotal();
//                                 return Padding(
//                                   padding: EdgeInsets.only(top: 10),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         "Total Price",
//                                         style: GoogleFonts.roboto(
//                                           color: Color(0x78000000),
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       Text(
//                                         "\$${totalPrice.toStringAsFixed(2)}",
//                                         style: GoogleFonts.inter(
//                                           color: Colors.black,
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               }),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     CustomBigButton(
//                       text: "Back To Home",
//                       routeName: HomePage(),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
