import 'package:easy_msg/ui/controller/sign_in_controller.dart';
import 'package:easy_msg/ui/screens/auth_screen/email_verification_screen.dart';
import 'package:easy_msg/ui/utility/app_color.dart';
import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:easy_msg/ui/widgets/background_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final _formState = GlobalKey<FormState>();
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackGroundWidgets(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),

                /*---IMAGE---*/
                SizedBox(
                  height: 160,
                  child: Image.asset(
                    AssetPath.signIn,
                    height: 180,
                    width: 180,
                    //color: Colors.yellow,
                  ),
                ),
                /*---Text---*/
                textDesign(),
                /*---TextField---*/
                textField(),
                /*---Buttons--*/
                buttons(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget textDesign() {
    return Column(
      children: [
        const Text('Login Here',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const SizedBox(height: 20),
        Container(
          width: 300,
          alignment: Alignment.center,
          child: const Text('Welcome back you’ve     been missed!',
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87)),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buttons() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              Get.to(() => EmailVerificationScreen());
            },
            child: const Text('Forgot your Password',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.white)),
          ),
        ),
        GetBuilder<SignInController>(
          builder: (signInController) {
            return Visibility(
              visible: !signInController.signInApiInProgress,
              replacement: Center(child: CircularProgressIndicator()),
              child: ElevatedButton(
                  onPressed: _onTapNextButton,
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(375, 50),
                      backgroundColor: Color(0x343a40),
                      foregroundColor: Colors.white),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20),
                  )),
            );
          },
        ),
        TextButton(
          onPressed: () {
            Get.toNamed('/2');
          },
          child: const Text('Create New Account',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white)),
        ),
      ],
    );
  }

  Widget textField() {
    return Column(
      children: [
        TextFormField(
          controller: _emailTEController,
          decoration: const InputDecoration(
              hintText: 'Email', hintStyle: TextStyle(color: Colors.grey)),
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
        const SizedBox(height: 28),
        TextFormField(
          controller: _passwordTEController,
          obscureText: _obsecureText,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.grey),
            /*enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[400] ?? Colors.grey),
                      ),*/

            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obsecureText = !_obsecureText;
                  });
                },
                icon: _obsecureText
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ],
    );
  }

  Future<void> _onTapNextButton() async {
    if (_formState.currentState!.validate()) {
      final bool result = await Get.find<SignInController>().signIn(
        _emailTEController.text.trim(),
        _passwordTEController.text,
      );
      if (result) {
        Get.offAllNamed('/mainNav');
      } else {
        if (mounted) {
          Get.snackbar('Error', 'Some issue occured');
        }
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
