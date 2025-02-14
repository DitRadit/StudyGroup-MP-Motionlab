import 'package:firebase/firebase_options.dart';
import 'package:firebase/pages/signInPage.dart';
import 'package:firebase/pages/signUpPage.dart';
import 'package:firebase/pages/todosPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkSignInStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator()); // Loading state
        }

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: snapshot.data == true ? '/todos' : '/sign-in',
          getPages: [
            GetPage(name: '/sign-in', page: () => SignInPage()),
            GetPage(name: '/sign-up', page: () => SignUpPage()),
            GetPage(name: '/todos', page: () => TodosPage()),
          ],
        );
      },
    );
  }

  Future<bool> checkSignInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    return userId != null;
  }
}
