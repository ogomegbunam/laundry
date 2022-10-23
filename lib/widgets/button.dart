import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color colour;
  final Color textcolour;
  final String title;
  final VoidCallback ontap;

  const Button({required this.colour, required this.title,required this.ontap,required this.textcolour});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      color: colour,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: colour,
          onPrimary: textcolour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: ontap,
        child:  Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,
            color: textcolour,),
        ),
      ),
    );
  }
}
