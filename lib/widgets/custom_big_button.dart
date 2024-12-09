import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBigButton extends StatelessWidget {
  final String text;
  final Widget? routeName;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onPressed;
  final double width;
  final double height;

  const CustomBigButton(
      {super.key,
      required this.text,
      this.routeName,
      this.backgroundColor = const Color(0xFF00623B),
      this.textColor = Colors.white,
      this.fontSize = 20,
      this.padding = const EdgeInsets.all(16),
      this.onPressed,
      this.width = double.infinity,
      this.height = 55.0});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          padding: MaterialStateProperty.all(padding),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
          minimumSize: MaterialStateProperty.all(Size(width, 50)),
        ),
        onPressed: () {
          if (routeName != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => routeName!),
            );
          }
        },
        child: Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: fontSize,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ));
  }
}
