import 'package:firebase/firebase_options.dart';
import 'package:firebase/pages/signInPage.dart';
import 'package:firebase/pages/signUpPage.dart';
import 'package:firebase/pages/todosPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await checkSignInStatus();
  runApp(MyApp());
}

Future<void> checkSignInStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('userId');
  try {
    if (userId != null) {
      Get.offNamed('/todos');
    } else {
      Get.offNamed('/sign-in');
    }
  } catch (e) {
    Get.offNamed('/sign-in');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/sign-in', page: () => SignInPage()),
        GetPage(name: 'sign-up', page: () => SignUpPage()),
        GetPage(name: '/todos', page: () => TodosPage()),
      ],
    );
  }
}
