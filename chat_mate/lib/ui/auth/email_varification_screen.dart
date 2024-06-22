import 'package:chat_mate/ui/auth/pin_verification_screen.dart';
import 'package:chat_mate/ui/auth/sign_in_screen.dart';
import 'package:chat_mate/widgets/background_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: BackgroundWidgets(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              ///scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Your Email Address',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'A 6 digit verification pin will be send to your email address',
                    //style: TextStyle(color: Colors.grey),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _onTapNext();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromWidth(double.maxFinite),
                            backgroundColor: Colors.greenAccent,
                            foregroundColor: Colors.white,
                          ),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.4,
                              ),
                              text: "Have an account? ",
                              children: [
                                TextSpan(
                                    text: 'Sign In',
                                    style: TextStyle(color: Colors.white),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _onTapSignInButton();
                                      }),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNext() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PinVerificationScreen(),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
