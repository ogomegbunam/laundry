import 'package:flutter/material.dart';
import 'package:laundry/widgets/button.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Address',
                style: TextStyle(color: Color(0xFFAE0A13),fontSize: 14),
              ),
              TextFormField(
                  cursorColor: Colors.grey,
                  // controller: emailController,

                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Address';
                    }

                    return null;
                  },
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFAE0A13)),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    prefixIcon: Icon(Icons.location_on_outlined),
                    prefixIconColor: Colors.grey,
                    focusColor: null,
                    hintText: 'Enter your Address',
                    hintStyle: TextStyle(fontSize: 12),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Button(
                  title: 'Request Pickup',
                  textcolour: Colors.white,
                  colour: const Color(0xFFAE0A13),
                  ontap: () {}
                  //: () {},
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
