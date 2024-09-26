import 'package:easy_msg/ui/controller/forgot_password_controller.dart';
import 'package:easy_msg/ui/widgets/background_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final _formState = GlobalKey<FormState>();
  bool _emailVerificationInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidgets(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 160),
                Text('Your Email Address',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 10),
                Text(
                  'A 6 digit verification pin will send to your email address',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _emailTEController,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w200, color: Colors.grey)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: !_emailVerificationInProgress,
                  //replacement: CenteredProgressIndicator(),
                  child: GetBuilder<ForgotPasswordController>(
                      builder: (forgotPasswordController) {
                    return Visibility(
                      visible: forgotPasswordController
                              .forgotPasswordApiInProgress ==
                          false,
                      replacement: Center(child: CircularProgressIndicator()),
                      child: ElevatedButton(
                          onPressed: onTapEmailVerification,
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(375, 50),
                              backgroundColor: Color(0x343a40),
                              foregroundColor: Colors.white),
                          child: const Text(
                            'Continue',
                            style: TextStyle(fontSize: 20),
                          )),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapEmailVerification() async {
    ForgotPasswordController forgotPasswordController =
        Get.find<ForgotPasswordController>();

    if (_formState.currentState!.validate()) {
      final bool result = await forgotPasswordController
          .forgotPassword(_emailTEController.text.trim());

      if (result == true) {
        Get.snackbar(
            'Confirmation', 'Password reset email sent to your email address.');
      } else {
        Get.snackbar(
            'Warning',
            forgotPasswordController.error.isNotEmpty
                ? forgotPasswordController.error
                : 'An unknown error occurred.');
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
