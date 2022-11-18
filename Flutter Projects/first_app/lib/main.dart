import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 6},
        {'text': 'Green', 'score': 8}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 6},
        {'text': 'Cat', 'score': 4},
        {'text': 'Horse', 'score': 10},
        {'text': 'Elephant', 'score': 8}
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Mike', 'score': 5},
        {'text': 'Null', 'score': 6},
        {'text': 'Naham', 'score': 8}
      ]
    },
    {
      'questionText': 'What\'s your favorite subject?',
      'answers': [
        {'text': 'Coding', 'score': 1},
        {'text': 'Designing', 'score': 3},
        {'text': 'Managmenent', 'score': 6},
        {'text': 'Testing', 'score': 10}
      ]
    },
    {
      'questionText': 'What\'s your favorite Language?',
      'answers': [
        {'text': 'C++', 'score': 10},
        {'text': 'Python', 'score': 5},
        {'text': 'Java', 'score': 6},
        {'text': 'JS', 'score': 8}
      ]
    },
    {
      'questionText': 'What\'s your favorite OS?',
      'answers': [
        {'text': 'MAC OS', 'score': 6},
        {'text': 'Windows', 'score': 5},
        {'text': 'Ubuntu', 'score': 7},
        {'text': 'Kali', 'score': 10}
      ]
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    // _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xffdfe6e9),
          appBar: AppBar(
            // leading: const Icon(Icons.account_circle_rounded),
            // leadingWidth: 70, // default is 56
            centerTitle: true,
            // backgroundColor: ,
            title: const Text('Quiz App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion)
              : Result(
                  resultScore: _totalScore, resetQuiz: _resetQuiz,
                )),
    );
  }
}
