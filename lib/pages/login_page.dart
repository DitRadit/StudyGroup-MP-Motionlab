import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/controller/login_controller.dart';
import 'package:home_page/routes/appPages.dart';
// import 'package:home_page/pages/home_page.dart';
import 'package:home_page/widgets/custom_big_button.dart';
import 'package:home_page/widgets/custom_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return FutureBuilder<bool>(
      future: loginController.checkLoginStatus(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.data == true) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.offNamed('/home');
          });
          return const SizedBox();
        }

        return MaterialApp(
          home: Scaffold(
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              child: Image.asset(
                                'assets/images/loginimg.png',
                                height: 280,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Text(
                            "Welcome!",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .5,
                            ),
                          ),
                          Text(
                            "Happy Shopping All",
                            style: TextStyle(
                              color: Color(0xFF707070),
                              fontFamily: 'Roboto',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: .5,
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomTextFieldWidget(
                            hintText: "Email",
                            icons: Icon(Icons.email_outlined),
                            controller: loginController.usernameController,
                          ),
                          SizedBox(height: 20),
                          CustomTextFieldWidget(
                            hintText: "Password",
                            icons: Icon(Icons.lock_outline),
                            controller: loginController.passwordController,
                          ),
                          SizedBox(height: 50),
                          CustomBigButton(
                            text: 'Login',
                            onTap: () {
                              loginController.login();
                            },
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              SizedBox(width: 20),
                              TextButton(
                                onPressed: () {
                                  Get.offNamed(Routes.REGISTER);
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00623B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
