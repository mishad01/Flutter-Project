import 'package:easy_msg/ui/screens/auth_screen/sign_in.dart';
import 'package:easy_msg/ui/widgets/background_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key, required this.email, required this.otp});
  final String email;
  final String otp;

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController _setPasswordTEController =
      TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
  bool resetPasswordInProgress = false;

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
              Text('Set Password',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text(
                'Minimum length password 8 characters with a letter and number combination',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _setPasswordTEController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _confirmPasswordTEController,
                decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: _onTapConfirmPassword,
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(375, 50),
                      backgroundColor: Color(0x343a40),
                      foregroundColor: Colors.white),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapConfirmPassword() {
    Get.to(() => SignIn());
  }

  @override
  void dispose() {
    _setPasswordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
