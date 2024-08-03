import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:easy_msg/ui/widgets/background_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _firebase = FirebaseAuth.instance;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  bool _isLogin = false;
  String _enteredEmail = '';
  String _enteredPassword = '';

  void _submit() async {
    final isValid = _formState.currentState!.validate();
    // if (isValid) {
    //   _formState.currentState!.save();
    //   print(_enteredEmail);
    //   print(_enteredPassword);
    // }
    if (!isValid) {
      return;
    }
    _formState.currentState!.save();

    if (_isLogin) {
      try {
        final userCredential = await _firebase.signInWithEmailAndPassword(
            email: _enteredPassword, password: _enteredPassword);
        print(userCredential);
      } on FirebaseAuthException catch (error) {
        if (error.code == 'email-already-in-use') {
          //
        }
        Get.closeAllSnackbars();
        Get.snackbar(error.message ?? 'Unknown Error', 'Authentication Failed');
      }
    } else {
      try {
        final userCredential = await _firebase.createUserWithEmailAndPassword(
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidgets(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formState,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: 350,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Image.asset(
                            AssetPath.signIn,
                          ),
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
                        const SizedBox(height: 10),
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
                                return "Enter Email Correctly";
                              }
                            },
                            onSaved: (newValue) {
                              _enteredPassword = newValue!;
                            },
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 40,
                          width: 90,
                          child: ElevatedButton(
                            onPressed: () {
                              _submit();
                            },
                            child: Text('Login'),
                          ),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: ' Sign Up',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed('/signUp');
                                  },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
    _passwordTEController.dispose();
  }
}
