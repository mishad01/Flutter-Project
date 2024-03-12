import 'package:firebase_database/firebase_database.dart';
import 'package:firelightsync_ignitionapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool On = false;
  final dbR = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutterr Iot Appp '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              On
                  ? const Icon(
                      Icons.lightbulb,
                      size: 70,
                      color: Colors.amber,
                    )
                  : const Icon(
                      Icons.lightbulb_outline,
                      size: 70,
                      color: Colors.amber,
                    ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  dbR.child("Light").set(
                    {"Switch": !On},
                  );
                  setState(() {
                    On = !On;
                  });
                },
                style: On
                    ? TextButton.styleFrom(backgroundColor: Colors.green)
                    : TextButton.styleFrom(backgroundColor: Colors.red),
                child: On
                    ? const Text(
                        'Turn On',
                        style: TextStyle(color: Colors.white),
                      )
                    : const Text(
                        'Turn Off',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
