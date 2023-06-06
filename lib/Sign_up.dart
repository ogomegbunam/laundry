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

  Future<void> _Signup({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final signup = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (signup.user != null) {
        DatabaseService()
            .addPhone(phone: phoneController.text, email: emailController.text);
        context.loaderOverlay.hide();
        // ignore: use_build_context_synchronously
        ShowSnackBar(context, ' Sign Up sucessful please login');

        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            PageTransition(
                child: const Login(), type: PageTransitionType.leftToRight));
      }
    } on FirebaseAuthException catch (e) {
      context.loaderOverlay.hide();

      if (e.code == 'weak-password') {
        ShowSnackBar(context, e.message!);

        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        ShowSnackBar(context, e.message!);
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {}
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   if (widget.loggedOut) {
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //       content: Text('You have been logged out.'),
    //     ));
    //   }
    // });
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
                    ? const Color(0xFF165044)
                    : const Color(0xFF165044),
                shape: BoxShape.circle),
          );
        },
      ),
      child: Scaffold(
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
                      'images/wwm2.png',
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
                      cursorColor: Colors.grey,
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
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade100, width: 2),
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 15.0),
                          // prefixIcon: Icon(FontAwesomeIcons.envelope),
                          prefixIconColor: Colors.white70,
                          focusColor: Colors.black38,
                          hintText: 'JohnDoe@email.com',
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.black12,
                              fontWeight: FontWeight.w400),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide.none))),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Phone Number',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                      controller: phoneController,
                      cursorColor: Colors.grey,
                      style: const TextStyle(
                          color: Colors.black54,
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
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black12, width: 2),
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 15.0),
                          prefixIconColor: Colors.white70,
                          focusColor: Colors.black12,
                          hintText: '08012345678',
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.black12,
                              fontWeight: FontWeight.w400),
                          border: const UnderlineInputBorder(
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
                        fillColor: Colors.grey.shade100,

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
                            color: Colors.black12,
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
                          return 'Please re-enter your password';
                        } else if (value != passwordController.text) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: confirmPasswordController,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,

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
                      title: 'Sign Up',
                      textcolour: Colors.white,
                      colour: const Color(0xFF165044),
                      ontap: _formKey.currentState?.validate() == true
                          ? () {
                              context.loaderOverlay.show();

                              _Signup(
                                  emailAddress: emailController.text,
                                  password: passwordController.text);
                            }
                          : () {}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
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
