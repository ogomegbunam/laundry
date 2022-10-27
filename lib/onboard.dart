// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:laundry/Sign_up.dart';
import 'package:laundry/auth/log_in.dart';
import 'package:laundry/widgets/button.dart';

class Onboard extends StatelessWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('images/E4.JPG'),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'images/Laundry3.png',
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Button(
                        colour: Colors.white,
                        title: 'Log In',
                        textcolour: Colors.black,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    Button(
                        colour: const Color(0xFFAE0A13),
                        title: 'Sign Up',
                        textcolour: Colors.white,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        })
                  ]),
                ),
              ))
        ],
      ),
    );
  }
}
