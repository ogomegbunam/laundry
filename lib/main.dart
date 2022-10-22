import 'package:flutter/material.dart';
import 'package:laundry/auth/log_in.dart';
import 'package:material_color_generator/material_color_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        primarySwatch: generateMaterialColor(color: const Color(0xFfAE0A13)),
      ),
      home: const Login(),
    );
  }
}
