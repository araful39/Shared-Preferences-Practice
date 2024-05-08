import 'package:flutter/material.dart';
import 'package:shared/views/homepage/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', true);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}