import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  CustomText(this.text);

  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 25),
    );
  }
}
