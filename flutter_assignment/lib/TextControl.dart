import 'package:flutter/material.dart';
import 'dart:math';
import 'CustomText.dart';

class TextControl extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {
  String _someText = 'initial value';

  String get randomText {
    final randomTexts = const [
      'test',
      'huh`?',
      '12 12',
      'not bad',
      'go on',
      '.....',
    ];
    var rng = new Random();
    var randomInt = rng.nextInt(randomTexts.length);
    return randomTexts[randomInt];
  }

  void _changeHanlder() {
    setState(() {
      _someText = randomText;
    });
  }

  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ElevatedButton(
        child: Text('Switch AppBar text', style: TextStyle(fontSize: 20)),
        onPressed: _changeHanlder,
      ),
      CustomText(_someText),
    ]);
  }
}
