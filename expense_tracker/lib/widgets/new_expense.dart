import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class newExpense extends StatefulWidget {
  newExpense({super.key});
  @override
  State<newExpense> createState() {
    return _newExpense();
  }
}

class _newExpense extends State<newExpense> {
  //First way of user input
  /* var _enteredTitle = ''; //Empty string
  void _savetitleInput(String inputValue) {
    _enteredTitle = inputValue;
  } */

  //Second way of user input
  final titleControler =
      TextEditingController(); //If we use this to get input then we need to use dispose() too.To delete it from memory
  final amountControler = TextEditingController();
  @override
  void dispose() {
    titleControler.dispose();
    amountControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          //onChanged:_savetitleInput, //It allows us to register a function whenever that will be triggered whenever the value int the text field is assigned
          controller: titleControler,
          maxLength: 50, //It assigns how many character can we write
          // keyboardType: TextInputType.text, //The whole keyboard will pop up
          decoration: const InputDecoration(
            //TO ADD LEVEL THE TEXT FIELD TO TELL USER WHICH KIND OF VALUE SHOULD BE ENTERD THERE
            label: Text("Title"),
          ),
        ),
        TextField(
          controller: amountControler,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText: '\$ ',
            label: Text('Amount'),
          ),
        ),
        Row(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(
                      context); //Its for cancel everything and here pop cancels the overlay and inside pop the context is fron build(context) which is in 31 line
                },
                child: Text("Cancel")),
            ElevatedButton(
                onPressed: () {
                  //print(_enteredTitle);
                  print(titleControler);
                  print(amountControler);
                },
                child: Text('Save Expense')),
          ],
        )
      ]),
    );
  }
}
