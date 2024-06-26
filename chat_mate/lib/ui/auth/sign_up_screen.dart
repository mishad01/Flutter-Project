import 'package:chat_mate/ui/utility/assets_paths.dart';
import 'package:chat_mate/widgets/background_widgets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidgets(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 200,
                      padding: EdgeInsets.all(10),
                      //color: Colors.yellow,
                      child: Image.asset(
                        AssetsPaths.SignUpLogo,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Join With Us',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    controller: _firstNameTEController,
                    decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    controller: _lastNameTEController,
                    decoration: InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(200, 50),
                        backgroundColor: Color(0xFF7C9DAB),
                        foregroundColor: Colors.white,
                      ),
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _passwordTEController.dispose();
  }
}
