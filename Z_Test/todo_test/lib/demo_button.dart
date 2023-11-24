import 'package:flutter/material.dart';

class DemoButtons extends StatefulWidget {
  DemoButtons({super.key});
  @override
  State<StatefulWidget> createState() {
    return _DemoButtons();
  }
}

class _DemoButtons extends State<DemoButtons> {
  var isunderstood = false;

  @override
  Widget build(BuildContext context) {
    print('Demo button BUILD Called');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    isunderstood = true;
                  });
                },
                child: const Text("YES")),
            TextButton(
                onPressed: () {
                  setState(() {
                    isunderstood = false;
                  });
                },
                child: const Text("NO")),
          ],
        ),
        if (isunderstood) Text("Awesome"),
      ],
    );
  }
}
