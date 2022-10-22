import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  const Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
width: MediaQuery.of(context).size.width,
      height: 48,
      color: const Color(0xFFAE0A13),
      child: ElevatedButton(
        onPressed: () {
          //Navigator.pushNamed(context, '/home');
        },
        child: const Text('Login'),
      ),
    );
  }
}
