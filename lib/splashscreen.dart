import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laundry/auth/log_in.dart';
import 'package:laundry/onboard.dart';


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
          context, MaterialPageRoute(builder: (context) => const Onboard()));
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
                color:  Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Center(
                    child: Image.asset(
                      'images/wwm3.png',

                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
