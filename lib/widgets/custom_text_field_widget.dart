import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final Widget? icons;

  CustomTextFieldWidget({super.key, this.hintText, this.icons});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(fontSize: 14, color: Color(0xFF00623B)),
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
