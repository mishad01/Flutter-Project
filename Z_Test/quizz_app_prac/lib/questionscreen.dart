import 'package:flutter/widgets.dart';

class questionScreen extends StatefulWidget {
  questionScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _questionScreen();
  }
}

class _questionScreen extends State<questionScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Hello"),
      ],
    );
  }
}
