import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_msg/services/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  File? _selectedImage;
  bool signUpInProgress = false;
  Future<void> signUp(String email, String userName, String password) async {
    signUpInProgress = true;
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null && _selectedImage != null) {
      Get.snackbar('Sign Up', 'User is successfully created');
      Get.offAllNamed("/signIn");

      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${user.uid}.jpg');

      await storageRef.putFile(_selectedImage!);
      final imageUrl = await storageRef.getDownloadURL();
      await FirebaseFirestore.instance.collection('user').doc(user.uid).set({
        'username': userName,
        'email': email,
        'image_url': imageUrl,
      });
    } else {
      Get.snackbar('Error', 'Some error Occurred');
    }
  }
}
