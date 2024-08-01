import 'package:flutter/material.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilites/urls.dart';
import 'package:task_manager/ui/screens/auth/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';
import 'package:task_manager/ui/widgets/centered_progress_indicetor.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

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
              Visibility(
                visible: resetPasswordInProgress == false,
                replacement: CenteredProgressIndicetor(),
                child: ElevatedButton(
                  onPressed: _onTapConfirmPassword,
                  child: Text('Confirm'),
                ),
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
    _resetPassword(_confirmPasswordTEController.text);
  }

  Future<void> _resetPassword(String password) async {
    resetPasswordInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> inputParams = {
      "email": widget.email,
      "OTP": widget.otp,
      "password": password,
    };

    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.resetPassword);
    resetPasswordInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Reset Password Success');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
        );
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context,
            response.errorMessage ?? 'Reset password failed! Try again');
      }
    }
  }

  @override
  void dispose() {
    _setPasswordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
