import 'package:flutter/material.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/startScreen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});
  State<quiz> createState() {
    return _quizzState();
  }
}

class _quizzState extends State<quiz> {
  //var activeScreen =StartScreen(); //we can store widgets in variables because widgets are objects and objects are regular number in dart
  //Widget? activeScreen; //by adding ? we can say active screen can also be null
  //Ternary Expressions
  //@override
  // void initState() {
  //   //Executed by Flutter when the StatefulWidget's State object is initialized
  //   //Its use for some initialization work..Which only wroks one
  //   activeScreen = StartScreen(switchScreen);
  //   super
  //       .initState(); //It makes sure in the parent class ,in state class initstate is executed as well to allow flutter to do its additional initializarion that might be performed in thtat parent class
  // }
  //ALternative of InitState()

  var activeScreen = 'start-screen';

  final List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      //activeScreen = const questionScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    //Here I expect to get the selected answer which should be type string
    selectedAnswers.add(answer);
  }

  @override
  Widget build(context) {
    //build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called.

    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = const questionScreen();
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 112, 55, 179),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : const questionScreen(),
        ),
      ),
    );
  }
}
