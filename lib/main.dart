
import 'package:flutter/material.dart';

import 'example_2/views/views.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

return runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomePage(),
    );
  }
}








