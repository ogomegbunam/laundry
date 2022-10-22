import 'package:flutter/material.dart';

import '../widgets/button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool passVisibility = true;
  bool validated = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  validateInput() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        validated = true;
      });
    } else {
      setState(() {
        validated = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text(
                    'Email Address',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white60,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: Color(0xFF3E414A),
                    child: TextFormField(
                        cursorColor: Colors.grey,

                        //autovalidateMode: AutovalidateMode.always,
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern.toString());
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else if (!regex.hasMatch(value)) {
                            return 'Enter Valid Email';
                          }

                          return null;
                        },
                        decoration: const InputDecoration(
                            fillColor: Color(0xFF3E414A),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white70, width: 2),
                            ),
                            contentPadding:
                                EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 15.0),
                            // prefixIcon: Icon(FontAwesomeIcons.envelope),
                            prefixIconColor: Colors.white70,
                            focusColor: Color(0xFF3E414A),
                            hintText: 'JohnDoe@email.com',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white10,
                                fontWeight: FontWeight.w400),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none))),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white60,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: Color(0xFF3E414A),
                    child: TextFormField(
                        cursorColor: Colors.grey,
                        obscureText: passVisibility,
                        onChanged: (val) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 8) {
                            return 'Password should be at least 8 characters';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordController,
                        decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 15.0),
                          // prefixIcon: const Icon(FontAwesomeIcons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passVisibility = !passVisibility;
                                });
                              },
                              icon: passVisibility
                                  ? const Icon(Icons.visibility_off,
                                      color: Colors.grey)
                                  : const Icon(Icons.visibility,
                                      color: Colors.grey)),
                          prefixIconColor: Colors.grey,
                          focusColor: null,
                          hintText: '*******',
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.white10,
                              fontWeight: FontWeight.w400),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        )),
                  ),
                  SizedBox(height: 60,),
                  Button(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
