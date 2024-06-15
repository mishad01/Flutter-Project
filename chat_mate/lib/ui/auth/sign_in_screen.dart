import 'package:chat_mate/widgets/background_widgets.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidgets(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                //Image.asset(AssetsPaths.appLogo),
                Text(
                  'Get Started With',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Login')),
                // const SizedBox(
                //   height: 5,
                // ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'I already have an account',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
