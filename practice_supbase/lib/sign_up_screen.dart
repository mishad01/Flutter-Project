import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_supbase/sign_in_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp(String email, String password) async {
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        Get.showSnackbar(
          GetSnackBar(
            message: 'Sign-up successful! Please verify your email.',
            title: "Success",
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            message: 'Sign-up failed! Please try again.',
            title: "Error",
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: 'Error: ${e.toString()}',
          title: "Failed",
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Up",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                signUp(emailController.text, passwordController.text);
              },
              child: Text("Sign Up"),
            ),
            TextButton(
              onPressed: () => Get.to(SignInScreen()),
              child: Text("Already have an account? Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
