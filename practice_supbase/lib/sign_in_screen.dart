import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_supbase/sign_up_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn(String email, String password) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
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
            Text("Sign In",
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
              onPressed: () {},
              child: Text("Sign In"),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Forgot Password?"),
            ),
            TextButton(
              onPressed: () => Get.to(SignUpScreen()),
              child: Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
