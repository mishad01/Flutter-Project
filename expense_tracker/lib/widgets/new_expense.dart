import 'package:flutter/material.dart';

class newExpense extends StatefulWidget {
  newExpense({super.key});
  @override
  State<newExpense> createState() {
    return _newExpense();
  }
}

class _newExpense extends State<newExpense> {
  var _enteredTitle = ''; //Empty string
  void _savetitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          onChanged:
              _savetitleInput, //It allows us to register a function whenever that will be triggered whenever the value int the text field is assigned
          maxLength: 50, //It assigns how many character can we write
          // keyboardType: TextInputType.text, //The whole keyboard will pop up
          decoration: const InputDecoration(
            //TO ADD LEVEL THE TEXT FIELD TO TELL USER WHICH KIND OF VALUE SHOULD BE ENTERD THERE
            label: Text("Title"),
          ),
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  print(_enteredTitle);
                },
                child: Text('Save Expense')),
          ],
        )
      ]),
    );
  }
}
