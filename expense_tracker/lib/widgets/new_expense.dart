import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:flutter/services.dart';

final formatter = DateFormat.yMd();

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
  //If we use this to get input then we need to use dispose() too.To delete it from memory
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  DateTime? _selectedDate; //it will either keep value or null

  @override
  void dispose() {
    titleControler.dispose();
    amountControler.dispose();
    super.dispose();
  }

  void presentDatePicker() async {
    //when we will find future then we can use this async
    //SHowdate picker builtin flutter function
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    // showDatePicker(
    //   context: context,
    //   initialDate: now,
    //   firstDate: firstDate,
    //   lastDate: now,
    //  );
    final pickedDate = await showDatePicker(
      //This await keyword internally tells flutter that this value hsould be stored in picked date wont be available immediately but atleast at some point in future and flutter should therefore basically wait before it stores in that variable
      //To store this showdate picker value we will use async besides function preameter and use await and put this inside a variable
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          //onChanged:_savetitleInput, //It allows us to register a function whenever that will be triggered whenever the value int the text field is assigned in 31 number line
          controller: titleControler,
          maxLength: 50, //It assigns how many character can we write
          // keyboardType: TextInputType.text, //The whole keyboard will pop up
          decoration: const InputDecoration(
            //TO ADD LEVEL THE TEXT FIELD TO TELL USER WHICH KIND OF VALUE SHOULD BE ENTERD THERE
            label: Text("Title"),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: amountControler,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixText: '\$ ',
                  label: Text('Amount'),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'No Date Selected'
                      : formatter.format(
                          _selectedDate!)), //using ! to froce dart to assume that this wont be null
                  IconButton(
                      onPressed: presentDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              ),
            ),
          ],
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
