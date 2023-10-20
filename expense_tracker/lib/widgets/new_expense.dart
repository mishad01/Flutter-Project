import 'package:flutter/material.dart';

class newExpense extends StatefulWidget {
  newExpense({super.key});
  @override
  State<newExpense> createState() {
    return _newExpense();
  }
}

class _newExpense extends State<newExpense> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          maxLength: 50, //It assigns how many character can we write
          // keyboardType: TextInputType.text, //The whole keyboard will pop up
          decoration: InputDecoration(
            //TO ADD LEVEL THE TEXT FIELD TO TELL USER WHICH KIND OF VALUE SHOULD BE ENTERD THERE
            label: Text("Title"),
          ),
        ),
      ]),
    );
  }
}
