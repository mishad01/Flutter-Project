import 'package:flutter/material.dart';
import 'package:quizz_app_prac/questionscreen.dart';
import 'package:quizz_app_prac/startscreen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});
  @override
  State<StatefulWidget> createState() {
    return _quiz();
  }
}

class _quiz extends State<quiz> {
  Widget activeScreen = startscreen(switchScreen);

  @override
  void initState() {
    activeScreen = startscreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = questionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
