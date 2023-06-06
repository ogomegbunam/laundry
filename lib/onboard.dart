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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('images/wwm3.png'),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.1), BlendMode.dstATop),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Image.asset(
                      'images/wwm.png',
                    ),
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
                        colour: const Color(0xFF165044),
                        title: 'Sign Up',
                        textcolour: Colors.white,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()));
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    Button(
                        colour: Color(0XFF00DFA2),
                        title: 'Log In',
                        textcolour: Colors.black,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        })
                  ]),
                ),
              ))
        ],
      ),
    );
  }
}
