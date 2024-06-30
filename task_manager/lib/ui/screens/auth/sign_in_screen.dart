import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/model/login_model.dart';
import 'package:task_manager/data/model/network_response.dart';
import 'package:task_manager/data/network_caller/network_caller.dart';
import 'package:task_manager/data/utilites/urls.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screens/auth/email_verification_screen.dart';
import 'package:task_manager/ui/screens/auth/sign_up_screen.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  bool _signInApiProgress = false;
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 160),
                  Text(
                    'Get Started With',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(hintText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter Email Address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: InputDecoration(hintText: 'Password'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter your password';
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: _signInApiProgress == false,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formState.currentState!.validate()) {
                          _signUp();
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: _onTapForgetPassword,
                      child: Text(
                        'Forget Password?',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(color: AppColors.themeColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ));
                              },
                          ),
                        ],
                      ),
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

  Future<void> _signUp() async {
    _signInApiProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestData = {
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text
    };
    final NetworkResponse networkResponse =
        await NetworkCaller.postRequest(Urls.login, body: requestData);
    _signInApiProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (networkResponse.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(networkResponse.responseData);
      await AuthController.saveUserAccessToken(loginModel.token!);
      await AuthController.saveUserData(loginModel.userModel!);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainBottomNavScreen(),
        ),
      );
    } else {
      showSnackBarMessage(
        context,
        networkResponse.errorMessage ??
            'Email or Password is not correct. Try Again',
      );
    }
  }

  void _onTapForgetPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailVerificationScreen(),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
