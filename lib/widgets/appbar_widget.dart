import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Widget? routeName;
  final Widget? icon;

  const NavBar({
    super.key,
    this.routeName,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: IconButton(
          icon: Image.asset(
            "assets/images/arrow.png",
            width: 24,
            height: 24,
          ),
          onPressed: () {
            if (routeName != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => routeName!),
              );
            }
          },
        ),
      ),
      title: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 56,
      toolbarHeight: kToolbarHeight,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: icon,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
