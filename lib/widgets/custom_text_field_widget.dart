import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  String? hintText;
  Widget? icons;

  CustomTextFieldWidget({super.key, this.hintText, this.icons});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
    );
  }
}
