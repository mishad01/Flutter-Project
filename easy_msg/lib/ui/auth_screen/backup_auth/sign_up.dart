import 'dart:io';

import 'package:easy_msg/ui/auth_screen/backup_auth/sign_in.dart';
import 'package:easy_msg/ui/controller/sign_up_controller.dart';
import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:easy_msg/ui/widgets/background_widgets.dart';
import 'package:easy_msg/ui/widgets/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _userNameTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final _formState = GlobalKey<FormState>();
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundWidgets(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 28),
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    AssetPath.signIn,
                    height: 180,
                    width: 180,
                    //color: Colors.yellow,
                  ),
                ),
                const Text('Create Account',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 5),
                /*Container(
                  width: 300,
                  alignment: Alignment.center,
                  child: const Text(
                      'Create an account so you can explore all the existing jobs',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),*/
                UserImagePicker(
                  onPickedImage: (pickedImage) {
                    _selectedImage = pickedImage;
                  },
                ),
                //const SizedBox(height: 20),
                // const SizedBox(height: 5),
                TextFieldColumn(),
                GetBuilder<SignUpController>(builder: (signUpController) {
                  return Visibility(
                    visible: signUpController.signUpApiInProgress == false,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(375, 50),
                            backgroundColor: Color(0x343a40),
                            foregroundColor: Colors.white),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 20),
                        )),
                  );
                }),
                TextButton(
                  onPressed: () {},
                  child: Text('Already Have an account',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget TextFieldColumn() {
    return Column(
      children: [
        TextFormField(
          controller: _emailTEController,
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.grey),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
        const SizedBox(height: 28),
        TextFormField(
          controller: _userNameTEController,
          decoration: InputDecoration(
            hintText: 'Username',
            hintStyle: TextStyle(color: Colors.grey),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your username';
            }
            return null;
          },
        ),
        const SizedBox(height: 28),
        TextFormField(
          controller: _passwordTEController,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.grey),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            return null;
          },
        ),
        const SizedBox(height: 28),
      ],
    );
  }

  void _submitForm() async {
    if (_formState.currentState!.validate()) {
      final bool result = await Get.find<SignUpController>().signUp(
          _emailTEController.text,
          _userNameTEController.text,
          _passwordTEController.text,
          _selectedImage);
      print('Checkingggg RESULT IS- ${result}');
      if (result) {
        Get.offAll(() => SignIn());
      } else {
        if (mounted) {
          Get.snackbar('Error', 'Some issue occured');
        }
      }
    }
  }
}
