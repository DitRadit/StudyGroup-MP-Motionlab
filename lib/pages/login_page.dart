import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_page/pages/register_page.dart';
import 'package:home_page/widgets/custom_text_field_widget.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  child: Lottie.asset(
                      height: 300, 'assets/lottie/lottie_login.json'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome!",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5),
                ),
              ),
              Text(
                "Happy Shopping All",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(fontSize: 25, letterSpacing: .5),
                ),
              ),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                hintText: "Email",
              ),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                hintText: "Password",
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text("Register")),
              Container(
                padding: EdgeInsets.all(30),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF00623B),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
