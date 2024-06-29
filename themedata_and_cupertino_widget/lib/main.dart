// import 'package:flutter/cupertino.dart';
//
// void main() {
//   runApp(iOSStyleApp());
// }
//
// class iOSStyleApp extends StatelessWidget {
//   const iOSStyleApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text('Home'),
//         trailing: CupertinoButton(
//           onPressed: () {},
//           child: Icon(CupertinoIcons.add),
//         ),
//       ),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CupertinoActivityIndicator(
//               radius: 25,
//             ),
//             CupertinoSwitch(
//               value: false,
//               onChanged: (value) {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          // style: ElevatedButton.styleFrom(
          //   backgroundColor: Colors.lime,
          //   foregroundColor: Colors.white,
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          // ),
          style: ButtonStyles.elevatedstyle,
        ),
        textButtonTheme: TextButtonThemeData(style: ButtonStyles.textButton),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      themeMode: ThemeMode.light,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ButtonStyles.elevatedstyle,
                onPressed: () {},
                child: Text('Tap to edit')),
            ElevatedButton(onPressed: () {}, child: Text('Tap to edit')),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {},
                child: Text('Tap to edit')),
            TextButton(onPressed: () {}, child: Text('Tap to edit')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonStyles {
  static ButtonStyle elevatedstyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.lime,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static ButtonStyle textButton = TextButton.styleFrom(
    // backgroundColor: Colors.green,
    foregroundColor: Colors.green,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    textStyle: TextStyle(
      fontSize: 20,
    ),
  );
}
