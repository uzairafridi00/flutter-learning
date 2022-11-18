import 'package:flutter/material.dart';


class Answer extends StatelessWidget {
  final VoidCallback? selectHandler;
  // final void Function()? selectHandler;
  final String answerText;
  const Answer(
      {super.key, required this.selectHandler, required this.answerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 200.0,
      margin: const EdgeInsets.all(10),
      // decoration: BoxDecoration(
      //   color: Colors.amberAccent,
      //   borderRadius: BorderRadius.circular(30),
      // ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple.shade400,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: selectHandler,
        child: Text(
          answerText,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
