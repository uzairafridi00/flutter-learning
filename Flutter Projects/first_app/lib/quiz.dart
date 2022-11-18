import 'package:flutter/material.dart';

import "./question.dart";
import "./answer.dart";

// Step 1: Define a Callback.
typedef IntCallback = void Function(int id);

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final int questionIndex;
  final IntCallback answerQuestion;

  const Quiz(
      {super.key,
      required this.questions,
      required this.questionIndex,
      required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionText: questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, dynamic>>)
            .map((answer) {
          return Answer(
              selectHandler: () => answerQuestion(answer['score']),
              answerText: answer['text'] as String);
        }).toList()
      ],
    );
  }
}
