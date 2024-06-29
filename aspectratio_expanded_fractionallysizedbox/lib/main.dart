import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Home'),
      ),
      body: Column(
        children: [
          //Flexible, Expanded

          /* Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: 100,
              //height: 100,
              color: Colors.red,
            ),
          ),
          Expanded(
            //It will fit to the screen
            //fit: FlexFit.tight,
            flex: 2, // It mainly divides
            child: Container(
              width: 100,
              // height: 100,
              color: Colors.yellow,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: 100,
              // height: 100,
              color: Colors.green,
            ),
          ),*/

          //FractionallySizedBox

          /*SizedBox(
            height: 500,
            width: MediaQuery.sizeOf(context).width,
            child: FractionallySizedBox(
              heightFactor: 0.1,
              widthFactor: 0.2,
              child: Container(
                color: Colors.red,
              ),
            ),
          )*/

          AspectRatio(
            //aspectRatio: width /height
            aspectRatio: 16 / 17,
            child: Container(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
