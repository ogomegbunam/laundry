import 'package:flutter/material.dart';
import 'package:laundry/auth/log_in.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:laundry/home.dart';
import 'package:laundry/requestPickUp.dart';
import 'package:laundry/requestService.dart';
import 'firebase_options.dart';
import 'package:laundry/splashscreen.dart';
import 'package:material_color_generator/material_color_generator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: generateMaterialColor(color: const Color(0xFF165044)),
      ),
      home:  const Splashscreen(),
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/splashscreen': (context) => const Splashscreen(),
        '/request': (context) => const RequestScreen(),
        '/requestService': (context) => const RequestService(),
      },
    );
  }
}
