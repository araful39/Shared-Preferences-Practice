
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  print(email);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null ? Login() : Home(),));
}





  class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(title: Text("Login"),),
  body: Center(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: emailController,
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(

        onPressed: () async {
        SharedPreferences pref =await SharedPreferences.getInstance();
        pref.setString("email", emailController.text);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
        return Home();
        }));
        },
        child: const Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ],
    ),
  ),
  ),
  );
  }
}



  class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(title: Text("Home"),),
  body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Email"),
      ElevatedButton(

      onPressed: () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove("email");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
      return Login();
      }));
      },
      child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
    ],
  ),
  ),
  );
  }
  }