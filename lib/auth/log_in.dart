import 'package:flutter/material.dart';

import '../widgets/button.dart';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [

              Button(),
            ],
          ),
        ),
      ),
    );
  }
}

