import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/controller/login_controller.dart';
import 'package:home_page/pages/home_page.dart';
import 'package:home_page/widgets/custom_big_button.dart';
import 'package:home_page/widgets/custom_text_field_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  child: Image.asset(
                      height: 280,
                      width: double.infinity,
                      'assets/images/loginimg.png'),
                ),
              ),
              Text(
                "Welcome!",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .5),
                ),
              ),
              Text(
                "Happy Shopping All",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      color: Colors.black, letterSpacing: .5, fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                hintText: "Email",
                icons: Icon(Icons.email_outlined),
              ),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                hintText: "Password",
                icons: Icon(Icons.lock_outline),
              ),
              SizedBox(height: 50),
              CustomBigButton(
                text: "Login",
                routeName: HomePage(),
              ),
              // ElevatedButton(
              //   style: ButtonStyle(),
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/register');
              //   },
              //   child: Container(
              //     padding: EdgeInsets.all(30),
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: Color(0xFF00623B),
              //     ),
              //     child: Text(
              //       "Login",
              //       style: TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white,
              //       ),
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.all(30),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: Color(0xFF00623B),
              //   ),
              //   child: Text(
              //     "Login",
              //     style: TextStyle(
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white,
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Don't have an account?",
                    style: TextStyle(fontSize: 14, color: Colors.black)),
                SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00623B)),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
