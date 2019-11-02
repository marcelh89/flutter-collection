import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Whats your fav color',
      'answers': [
        {'text': 'blue', 'score': 5},
        {'text': 'red', 'score': 2},
        {'text': 'green', 'score': 1},
        {'text': 'black', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your fav animal',
      'answers': [
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Dog', 'score': 1},
        {'text': 'Snake', 'score': 8},
        {'text': 'Spider', 'score': 10}
      ]
    },
    {
      'questionText': 'Who is your favorite Instructor',
      'answers': [
        {'text': 'Max', 'score': 2},
        {'text': 'Max', 'score': 8},
        {'text': 'Max', 'score': 10},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('we have more questions');
    }
  }

  void _resetQuiz(){
    setState(() {
        _questionIndex = 0;
        _totalScore = 0;
    });
   
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
