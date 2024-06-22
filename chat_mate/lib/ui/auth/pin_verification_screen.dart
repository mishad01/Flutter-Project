import 'package:chat_mate/ui/auth/set_password_screen.dart';
import 'package:chat_mate/widgets/background_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();
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
                    height: 20,
                  ),
                  Text(
                    'PIN Verification',
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
                  PinCodeTextField(
                    length: 6,
                    //obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedColor: Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    //errorAnimationController: errorController,
                    controller: _pinTEController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    appContext: context,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _onTapVerifyButton();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromWidth(double.maxFinite),
                            backgroundColor: Colors.greenAccent,
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Verify'),
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

  void _onTapVerifyButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SetPasswordScreen(),
      ),
    );
  }
}
