import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  String? hintText;

  CustomTextFieldWidget({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        icon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
    );
  }
}
