import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/auth/sign_up_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController _setPasswordTEController =
      TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidgets(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 160),
              Text(
                'Set Password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Minimum length password 8 character with latter and number combination',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _setPasswordTEController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _confirmPasswordTEController,
                decoration: InputDecoration(hintText: 'Confrim Password'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _onTapConfirmPassword,
                child: Text('Confirm'),
              ),
              const SizedBox(height: 30),
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

  void _onTapConfirmPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _setPasswordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
