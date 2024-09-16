import 'package:easy_msg/services/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController {
  final FirebaseAuthServices auth = FirebaseAuthServices();
  Future<void> signIn(String email, String password) async {
    User? user = await auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      Get.offNamed('/chatScreen');
    } else {
      Get.snackbar('Error', 'Some error has occurred',
          backgroundColor: Colors.red,
          titleText: const Text(
            'Error',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
          messageText: const Text('Some error occurred',
              style: TextStyle(fontSize: 14, color: Colors.white)));
    }
  }
}
