import 'package:flutter/material.dart';
import 'package:quizz_app/answerButton.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class questionScreen extends StatefulWidget {
  const questionScreen({super.key});
  //final void Function(String answer) onSelectAnswer;
  @override
  State<questionScreen> createState() {
    return _questionScreen();
  }
}

class _questionScreen extends State<questionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    //widget.onSelectAnswer('...');
    setState(() {
      currentQuestionIndex++; //To execute this we must use setStatee
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        //We are using container to get mergin option
        margin: const EdgeInsets.all(
            20), //Using this we can rezie the answet botton box size
        child: Column(
          //Padding is the internal spacing  between content and the borders
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment
              .stretch, //The box stretched out the full screen
          children: [
            Text(
              currentQuestion.txt,
              style: GoogleFonts.mooli(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign
                  .center, //We want the question in center thats why we did this
            ),
            const SizedBox(height: 20),
            ...currentQuestion.getShuffledAnswer().map((item) {
              const SizedBox(
                height: 20,
              );
              return answerButton(
                txt: item,
                onTap: answerQuestion,
              );
            }),
          ],
        ),
      ),
    );
  }
}
