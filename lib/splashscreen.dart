import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laundry/auth/log_in.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: const Color(0xFF1E1E1E),
                child: Center(
                  child: Image.asset(
                    'images/Laundry3.png',
                    
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
