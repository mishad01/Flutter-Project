import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:easy_msg/ui/widgets/background_widgets.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BackgroundWidgets(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formState,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset(
                      AssetPath.signIn,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 330,
                    child: TextFormField(
                      controller: _emailTEController,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Enter Email Correctly";
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    width: 330,
                    child: TextFormField(
                      controller: _emailTEController,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Enter Email Correctly";
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
