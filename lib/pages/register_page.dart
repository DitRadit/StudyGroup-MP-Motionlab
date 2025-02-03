import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/pages/login_page.dart';
import 'package:home_page/routes/appPages.dart';
import 'package:home_page/widgets/custom_big_button.dart';
import 'package:home_page/widgets/custom_text_field_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Create your account for Happy Shopping",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Color(0xFF707070),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 50),
              CustomTextFieldWidget(
                hintText: "Full Name",
                icons: Icon(Icons.person_4_outlined),
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
              SizedBox(height: 20),
              CustomTextFieldWidget(
                hintText: "Confirm Password",
                icons: Icon(Icons.lock_outline),
              ),
              SizedBox(height: 50),
              CustomBigButton(
                text: 'Register',
                onTap: () {
                  Get.offAndToNamed(Routes.LOGIN);
                },
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                  SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00623B)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
