import 'package:flutter/material.dart';
import 'package:theming_and_navigation/profile.dart';
import 'package:theming_and_navigation/settings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Settings(),
                    ),
                  );
                },
                child: Text('Go to settings')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(username: 'Mishad'),
                      )).then((value) {
                    print(value);
                  });
                },
                child: Text('Go to profile')),
          ],
        ),
      ),
    );
  }
}
