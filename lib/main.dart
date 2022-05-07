import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const value never change in compile time also never change in runtime
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Red', 'Green', 'Blue', 'White'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Dog', 'Cat', 'Tiger', 'Lion'],
    },
    {
      'questionText': 'What\'s your favorite movie?',
      'answers': ['Puspa', 'Matrix', 'SpiderMan No Way Home', 'KGF'],
    },
    {
      'questionText': 'What\'s your favorite music?',
      'answers': ['New Collections', 'Old Collections', 'Both'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex < _questions.length) {}
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // // dummy.add('Max');
    // print(dummy);
    // _questions=[]; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(_questions[_questionIndex]['questionText']),
            ...(_questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answers(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
