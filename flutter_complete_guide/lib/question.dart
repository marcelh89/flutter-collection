import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Question extends StatelessWidget {
  var questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Text(
      questionText,
      style: TextStyle(
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    ));
  }
}
