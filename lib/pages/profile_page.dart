import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/controller/login_controller.dart';
import 'package:home_page/widgets/appbar_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return FutureBuilder<Map<String, String>>(
      future: loginController.getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Error loading user data'));
        }

        final userInfo = snapshot.data;

        return Scaffold(
          appBar: NavBar(
            text: "Profile Page",
            rightWidget: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                loginController.logout();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username: ${userInfo?['Username']}',
                  style: const TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  'First Name: ${userInfo?['First Name']}',
                  style: const TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text(
                  'Last Name: ${userInfo?['Last Name']}',
                  style: const TextStyle(fontSize: 18),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    loginController.logout();
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
