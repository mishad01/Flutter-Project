import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewExpanse();
  }
}

class _NewExpanse extends State<NewExpense> {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  @override
  void dispose() {
    titleControler.dispose();
    amountControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: titleControler,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                ),
              ),
              Row(
                children: [
                  Text('Select Date'),
                  IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month))
                ],
              )
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}
