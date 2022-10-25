import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:laundry/network_services/database_service.dart';
import '../widgets/button.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:page_transition/page_transition.dart';
import 'Utils/snackbar.dart';
import 'auth/log_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                    ? const Color(0xFFAE0A13)
                    : const Color(0xFFAE0A13),
                shape: BoxShape.circle),
          );
        },
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        //backgroundColor: Color,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [
                    Image.asset(
                      'images/Laundry3.png',
                    ),
                  ]),
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
                  TextFormField(
                      controller: emailController,
                      cursorColor: Colors.grey,
                      style: const TextStyle(
                          color: Colors.white,
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
                      decoration: const InputDecoration(
                          fillColor: Color(0xFF3E414A),
                          filled: true,
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
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Phone Number',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white60,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                      controller: phoneController,
                      cursorColor: Colors.grey,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        Pattern pattern =
                            r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
                        RegExp regex = RegExp(pattern.toString());
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (!regex.hasMatch(value)) {
                          return 'Enter a valid phone number';
                        }

                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          fillColor: Color(0xFF3E414A),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white70, width: 2),
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 15.0),
                          prefixIconColor: Colors.white70,
                          focusColor: Color(0xFF3E414A),
                          hintText: '08012345678',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white10,
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
                        color: Colors.white60,
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
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        fillColor: const Color(0xFF3E414A),

                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white70, width: 2),
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
                          borderSide: BorderSide.none,
                        ),
                      )),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Confirm Password',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white60,
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
                          return 'Please re-enter your password';
                        } else if (value != passwordController.text) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: confirmPasswordController,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        fillColor: const Color(0xFF3E414A),

                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white70, width: 2),
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
                          borderSide: BorderSide.none,
                        ),
                      )),
                  const SizedBox(
                    height: 60,
                  ),
                  Button(
                      title: 'Sign Up',
                      textcolour: Colors.white,
                      colour: const Color(0xFFAE0A13),
                      ontap: _formKey.currentState?.validate() == true
                          ? () {
                              //context.loaderOverlay.show();
                              Future<void> _Signup({
                                required String emailAddress,
                                required String password,
                              }) async {
                                try {
                                  final signup = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  if (signup.user != null) {
                                  //   final userPhone = await DatabaseService()
                                  //       .addPhone(
                                  //           phone: phoneController.text,
                                  //           email: emailController.text);
                                  // //  context.loaderOverlay.hide();
                                    // ignore: use_build_context_synchronously

                                    // ignore: use_build_context_synchronously
                                    ShowSnackBar(context,
                                        ' Sign Up sucessful please login');

                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: const Login(),
                                            type: PageTransitionType
                                                .leftToRight));
                                  }
                                } on FirebaseAuthException catch (e) {
                                 // context.loaderOverlay.hide();

                                  if (e.code == 'weak-password') {
                                    ShowSnackBar(context, e.message!);

                                    if (kDebugMode) {
                                      print(
                                          'The password provided is too weak.');
                                    }
                                  } else if (e.code == 'email-already-in-use') {
                                    ShowSnackBar(context, e.message!);
                                    if (kDebugMode) {
                                      print(
                                          'The account already exists for that email.');
                                    }
                                  }
                                } catch (e) {
                                  if (kDebugMode) {
                                    print(e);
                                  }
                                } finally {}
                              }
                            }
                          : () {}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                          child: const Text('Log in'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
