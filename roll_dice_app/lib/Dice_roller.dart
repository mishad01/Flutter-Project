import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget{
  @override
  State <DiceRoller> createState(){
    return
  }
}

class _DiceRollerState extends State<DiceRoller>{
  @override
  var activeImage;
  Widget build (context){
    return Column(children: [Image.asset(activeImage,width: 200,),],);
  }
}