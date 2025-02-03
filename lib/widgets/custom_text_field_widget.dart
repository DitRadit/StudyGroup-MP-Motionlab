import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final Widget? icons;
  final TextEditingController? controller;

  CustomTextFieldWidget(
      {super.key, this.hintText, this.icons, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            fontFamily: 'Roboto', fontSize: 14, color: Color(0xFF00623B)),
        prefixIcon: IconTheme(
          data: IconThemeData(color: Color(0xFF00623B)),
          child: icons ?? Icon(Icons.person),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF00623B)),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
