/*
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_msg/services/firebase_auth_services.dart';
import 'package:easy_msg/ui/controller/sign_up_controller.dart';
import 'package:easy_msg/ui/widgets/background_widgets.dart';
import 'package:easy_msg/ui/widgets/user_image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  final TextEditingController _userNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  File? _selectedImage;
  bool signUpInProgress = false;

  */
/*String _enteredEmail = '';
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
  }*/ /*

  void initState() {
    super.initState();
    // Initialize the SignInController
    Get.put(SignUpController());
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
                      // Image.asset(
                      //   AssetPath.signUp,
                      //   height: 250,
                      //   width: 250,
                      // ),
                      const SizedBox(height: 120),
                      UserImagePicker(
                        onPickedImage: (pickedImage) {
                          _selectedImage = pickedImage;
                        },
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
                          // onSaved: (newValue) {
                          //   _enteredEmail = newValue!;
                          // },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: TextFormField(
                          controller: _userNameTEController,
                          decoration: const InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Enter First Name Correctly";
                            }
                          },
                        ),
                      ),
                      */
/*const SizedBox(height: 20),
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
                      ),*/ /*

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
                          // onSaved: (newValue) {
                          //   _enteredPassword = newValue!;
                          // },
                        ),
                      ),
                      const SizedBox(height: 20),
                      GetBuilder<SignUpController>(builder: (signUpController) {
                        return Visibility(
                          visible:
                              !signUpController.signUpApiInProgress == false,
                          replacement: CircularProgressIndicator(),
                          child: ElevatedButton(
                              onPressed: _signUp, child: Text('Sign Up')),
                        );
                      })
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

  void _signUp() async {
    setState(() {
      signUpInProgress = true;
    });
    String email = _emailTEController.text;
    String password = _passwordTEController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null && _selectedImage != null) {
      Get.snackbar('Sign Up', 'User is successfully created');
      Get.offAllNamed("/signIn");

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${user.uid}.jpg');

      await storageRef.putFile(_selectedImage!);
      final imageUrl = await storageRef.getDownloadURL();
      print(imageUrl);
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'username': _userNameTEController.text,
        'email': email,
        'image_url': imageUrl,
      });
    } else {
      Get.snackbar('Error', 'Some error Occurred');
    }
    setState(() {
      signUpInProgress = false;
    });
  }
  */
/*void signUp() async {
    String email = _emailTEController.text;
    String password = _passwordTEController.text;

    // Sign up the user
    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    // Check if the user is created and an image is selected
    if (user != null && _selectedImage != null) {
      // Notify the user of successful sign up
      Get.snackbar('Sign Up', 'User is successfully created');

      // Get a reference to the location in Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${user.uid}.jpg');

      try {
        // Upload the selected image to Firebase Storage
        await storageRef.putFile(_selectedImage!);

        // Retrieve the image's download URL
        final imageUrl = await storageRef.getDownloadURL();

        // Optional: Print the image URL or store it in Firestore
        print('Image uploaded. Download URL: $imageUrl');

        // Optionally, update the user's profile with the image URL
        await user.updatePhotoURL(imageUrl);

        // Navigate to another screen (e.g., sign-in)
        Get.offNamed("/signIn");
      } catch (error) {
        Get.snackbar('Upload Error', 'Failed to upload image: $error');
        print('Failed to upload image: $error');
      }
    } else {
      // Handle the error when user creation or image selection fails
      Get.snackbar('Error', 'Some error occurred');
    }
  }*/ /*


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTEController.dispose();
    _userNameTEController.dispose();
    _lastNameTEController.dispose();
    _passwordTEController.dispose();
  }
}
*/
