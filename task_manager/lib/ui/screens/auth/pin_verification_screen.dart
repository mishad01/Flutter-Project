import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/screens/auth/set_password_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';

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
      body: BackGroundWidgets(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 160),
              Text(
                'PIN Verification',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'A 6 digit verification pin will send to your email address',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 10),
              _buildPinCodeTextField(context),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _onTapVerifyScreen,
                child: Text('Verify'),
              ),
              const SizedBox(height: 30),
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: 'Have account?  ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.4,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(color: AppColors.themeColor),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  PinCodeTextField _buildPinCodeTextField(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedColor: AppColors.themeColor,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: _pinTEController,
      appContext: context,
      keyboardType: TextInputType.number,
    );
  }

  void _onTapVerifyScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SetPasswordScreen(),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pinTEController.dispose();
  }
}
