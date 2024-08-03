import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:easy_msg/ui/widgets/background_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _firebase = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  String _enteredEmail = '';
  String _enteredPassword = '';
  bool _isAuthenticating = false;
  bool _isLogin = true;
  void _submitSignUp() {
    final isValid = _formState.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formState.currentState!.save();
    try {
      final userCredential = _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
      print(userCredential);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        //
      }
      Get.closeAllSnackbars();
      Get.snackbar(error.message ?? 'Unknown Error', 'Authentication Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidgets(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: 350,
                child: Form(
                  key: _formState,
                  child: Column(
                    children: [
                      Image.asset(
                        AssetPath.signUp,
                        height: 250,
                        width: 250,
                      ),
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: TextFormField(
                          controller: _emailTEController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Enter Email Correctly";
                            }
                          },
                          onSaved: (newValue) {
                            _enteredEmail = newValue!;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: TextFormField(
                          controller: _firstNameTEController,
                          decoration: const InputDecoration(
                            hintText: 'First Name',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Enter First Name Correctly";
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: TextFormField(
                          controller: _lastNameTEController,
                          decoration: const InputDecoration(
                            hintText: 'Last Name',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Enter Last Name Correctly";
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: TextFormField(
                          controller: _passwordTEController,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Enter password Correctly";
                            }
                          },
                          onSaved: (newValue) {
                            _enteredPassword = newValue!;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            _submitSignUp();
                          },
                          child: Text('Sign Up'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _passwordTEController.dispose();
  }
}
