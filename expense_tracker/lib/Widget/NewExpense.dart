import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NewExpanse();
  }
}

class _NewExpanse extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Point 1'),
      ],
    );
  }
}
