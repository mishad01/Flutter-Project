import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilites/urls.dart';
import 'package:task_manager/ui/screens/auth/sign_in_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/utility/app_constants.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

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
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _registrationInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidgets(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formState,
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
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Your Email';
                      }
                      if (AppConstants.emailRegEx.hasMatch(value!) == false) {
                        return 'Enter a valid Email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _fnTEController,
                    decoration: InputDecoration(hintText: 'First Name'),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your name correctly';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _lnTEController,
                    decoration: InputDecoration(hintText: 'Last Name'),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your name correctly';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _mobileTEController,
                    decoration: InputDecoration(hintText: 'Mobile'),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your mobile correctly';
                      }
                      if (AppConstants.mobileRegex.hasMatch(value!) == false) {
                        return 'Enter mobile number correctly';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: _showPassword == false,
                    controller: _passwordTEController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          _showPassword = !_showPassword;
                          if (mounted) {
                            setState(() {});
                          }
                        },
                        icon: _showPassword
                            ? Icon(Icons.remove_red_eye)
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Password Correctly';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: _registrationInProgress == false,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formState.currentState!.validate()) {
                          _registerUser();
                        }
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined),
                    ),
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
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInScreen(),
                                    ),
                                    (route) => false,
                                  );
                                },
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registerUser() async {
    _registrationInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestInput = {
      "email": _emailTEController.text.trim(),
      "firstName": _fnTEController.text.trim(),
      "lastName": _lnTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text,
      "photo": ""
    };
    NetworkResponse response =
        await NetworkCaller.postRequest(Urls.registration, body: requestInput);
    _registrationInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      _clearText();
      if (mounted) {
        showSnackBarMessage(context, 'Registration success');
      }
    } else {
      if (mounted) {
        showSnackBarMessage(context,
            response.errorMessage ?? 'Registration Failed, Try again.');
      }
    }
  }

  void _clearText() {
    _emailTEController.clear();
    _passwordTEController.clear();
    _lnTEController.clear();
    _fnTEController.clear();
    _mobileTEController.clear();
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
