import 'package:flutter/material.dart';

var a = Alignment.topCenter;
var b = Alignment.bottomCenter;

class gradientContainer extends StatelessWidget {
  gradientContainer({super.key, required this.colors});
  List<Color> colors;
  void rolldice() {}
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [Color.fromARGB(255, 66, 60, 60), Colors.cyan],
          begin: a,
          end: b,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            //Here it will take a list of widget
            Image.asset(
              'assets/images/dice-1.png',
              width: 200,
            ),
            //After that image we can use buttons
            //Flutter supports 3 different buttons
            //TextButton(onPressed: onPressed, child: child)     //Its a presseable text button where we can press on a text and there text will work as a button
            //Here in onpressed we will use fuctions and in child we will use text('Hello') type of something
            // Way 1: Here onPressed: (){}; So in first bracet it will be like function name test() {}..Inside the curly braces there will be any code or statatement that I wanna give
            //Way 2 : onPressed:test,child: on up we can create test function and we can just give the name of function then
            //ElevatedButton(onPressed: onPressed, child: child) //It has a background color and slight shadow
            //OutlinedButton(onPressed: onPressed, child: child) //It's a button that has no background color but a border
            TextButton(
              onPressed: rolldice,
              child: Text('Roll Dice'),
            )
          ],
        ),
      ),
    );
  }
}
