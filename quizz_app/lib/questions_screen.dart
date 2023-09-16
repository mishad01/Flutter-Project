import 'package:flutter/material.dart';

class questionScreen extends StatefulWidget {
  const questionScreen({super.key});
  @override
  State<questionScreen> createState() {
    return _questionScreen();
  }
}

class _questionScreen extends State<questionScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Questions..',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Answer 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Answer 2'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Answer 3'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Answer 4'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Answer 5'),
          ),
        ],
      ),
    );
  }
}
