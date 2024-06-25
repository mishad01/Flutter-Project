import 'package:flutter/material.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _fnTEController = TextEditingController();
  final TextEditingController _lnTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidgets(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 120),
              Text(
                'Join With Us',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailTEController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _fnTEController,
                decoration: InputDecoration(hintText: 'First Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _lnTEController,
                decoration: InputDecoration(hintText: 'Last Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _mobileTEController,
                decoration: InputDecoration(hintText: 'Mobile'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordTEController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const SizedBox(height: 10),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Have account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _fnTEController.dispose();
    _lnTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
