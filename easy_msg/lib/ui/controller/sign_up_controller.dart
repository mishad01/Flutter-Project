import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_msg/services/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  String _errorMessage = '';
  bool _signUpApiProgress = false;

  // Getters for exposing the private variables
  bool get signUpApiInProgress => _signUpApiProgress;
  String get errorMessage => _errorMessage;

  Future<bool> signUp(String fullName, String email, String userName,
      String password, File? _selectedImage) async {
    bool isSuccess = false;
    _signUpApiProgress = true;
    update();

    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    _signUpApiProgress = false;
    update();
    if (user != null && _selectedImage != null) {
      Get.snackbar('Sign Up', 'User is successfully created');
      Get.offNamed('/1');

      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${user.uid}.jpg');

      await storageRef.putFile(_selectedImage!);
      final imageUrl = await storageRef.getDownloadURL();
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'username': userName,
        'email': email,
        'image_url': imageUrl,
        'full_name': fullName,
      });
      isSuccess = true;
    } else {
      Get.snackbar('Error', 'Some error Occurred');
    }
    _signUpApiProgress = false;
    update();
    return isSuccess;
  }
}
