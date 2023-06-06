import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:laundry/Sign_up.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:page_transition/page_transition.dart';

import '../Utils/snackbar.dart';
import '../home.dart';
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

  Future<void> _signin({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final signin = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (signin.user != null) {
        context.loaderOverlay.hide();
        ShowSnackBar(context, ' Log in sucessful ');
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: const Home(),
            type: PageTransitionType.rightToLeft,
          ),
        );
      }

    } on FirebaseAuthException catch (e) {
      context.loaderOverlay.hide();
      if (e.code == 'user-not-found') {
        ShowSnackBar(context, e.message!);
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        ShowSnackBar(context, e.message!);
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    } catch (e) {
      print('error');
      if (kDebugMode) {
        print(e);
      }
    }
  }
  //   @override
  // void dispose() {
  //   super.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return LoaderOverlay(
      overlayColor: Colors.black,
      overlayOpacity: 0.2,
      overlayWholeScreen: true,
      useDefaultLoading: false,
      overlayWidget: SpinKitFadingCircle(
        size: 100,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
                color: index.isEven
                    ? const Color(0xFF165044)
                    : const Color(0xFF165044),
                shape: BoxShape.circle),
          );
        },
      ),
      child: Scaffold(
        //backgroundColor: Color,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF165044),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container(
                          child: Image.asset(
                            'images/wwm.png',
                            // width: screenSize.width * 0.4,
                            //height: 50,
                            // fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ]),
                    const Text(
                      'Email Address',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: emailController,
                        cursorColor: Colors.black12,
                        style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern.toString());
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else if (!regex.hasMatch(value)) {
                            return 'Enter a Valid Email';
                          }

                          return null;
                        },
                        decoration:  InputDecoration(
                            fillColor: Colors.grey.shade50,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black12, width: 2),
                            ),
                            contentPadding:
                                EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 15.0),
                            // prefixIcon: Icon(FontAwesomeIcons.envelope),
                            prefixIconColor: Colors.black,
                            focusColor: Colors.black12,
                            hintText: 'JohnDoe@email.com',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w400),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none))),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
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
                        style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          fillColor:  Colors.grey.shade100,

                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black12, width: 2),
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
                                      color: Colors.black38)
                                  : const Icon(Icons.visibility,
                                      color: Colors.black38)),
                          prefixIconColor: Colors.grey,
                          focusColor: null,
                          hintText: '*******',
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.black12,
                              fontWeight: FontWeight.w400),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        )),
                    const SizedBox(
                      height: 60,
                    ),
                    Button(
                        title: 'Log In',
                        textcolour: Colors.white,
                        colour: const Color(0xFF165044),
                        ontap: () {
                          context.loaderOverlay.show();
                          _signin(
                            emailAddress: emailController.text,
                            password: passwordController.text,
                          );
                        }
                        //: () {},
                        ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));

                              // Navigator.pushNamed(context, '/sign_up');
                            },
                            child: const Text('Sign Up'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
