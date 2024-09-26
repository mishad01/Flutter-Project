import 'package:easy_msg/ui/screens/auth_screen/back_up_auth/set_password_screen.dart';
import 'package:easy_msg/ui/utility/app_color.dart';
import 'package:easy_msg/ui/widgets/background_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key, required this.email});
  final String email;

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();
  bool _otpVerificationInProgress = false;

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
              Text('PIN Verification',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 10),
              Text(
                'A 6 digit verification pin will be sent to your email address',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              _buildPinCodeTextField(context),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: _onTapVerifyScreen,
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(375, 50),
                      backgroundColor: Color(0x343a40),
                      foregroundColor: Colors.white),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20),
                  )),
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
        selectedColor: AppColor.themeColor,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: _pinTEController,
      appContext: context,
      keyboardType: TextInputType.number,
    );
  }

  void _onTapVerifyScreen() {
    Get.to(() => SetPasswordScreen(email: '', otp: ''));
  }

  @override
  void dispose() {
    _pinTEController.dispose();
    super.dispose();
  }
}
