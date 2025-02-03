import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class CustomBigButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final double width;
  final double height;

  const CustomBigButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor = const Color(0xFF00623B),
    this.textColor = Colors.white,
    this.fontSize = 20,
    this.padding = const EdgeInsets.all(16),
    this.width = double.infinity,
    this.height = 55.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: fontSize,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
