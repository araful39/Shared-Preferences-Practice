import 'package:flutter/material.dart';
import 'package:shared/views/homepage/home_page.dart';
import 'package:shared/views/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<bool>(
          future: checkLoginStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.data == true) {
                return const HomePage();
              } else {
                return const LoginScreen();
              }
            }
          },
        ),
      ),
    );
  }

  Future<bool> checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}