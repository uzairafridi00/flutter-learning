import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
  const Result({super.key, required this.resultScore, required this.resetQuiz});

  String get resultPhrase {
    String resultText;

    if (resultScore <= 15) {
      resultText = 'You are so bad';
    } else if (resultScore <= 30) {
      resultText = "Pretty Likeable";
    } else if (resultScore <= 40) {
      resultText = "You are Brilliant";
    } else {
      resultText = 'You are Extra Ordinary';
    }

    return '$resultText $resultScore';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: resetQuiz,
              child: const Text(
                'Restart Quiz',
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
