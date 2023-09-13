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
          //Its by default takes all the vartical space
          //So if wanna make it vartically centered we use this
          mainAxisSize: MainAxisSize.min, //using this we centered it
          children: [
            //Here it will take a list of widget
            Image.asset(
              'assets/images/dice-1.png',
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: rolldice,
              style: TextButton.styleFrom(
                //padding: const EdgeInsets.only(
                //top: 20), //Padding is mainly giving space
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 25),
              ),
              child: const Text('Roll Dice'),
            )
          ],
        ),
      ),
    );
  }
}
