import 'package:easy_msg/ui/auth_screen/backup_auth/sign_up.dart';
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
        body: BackgroundWidgets(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              SizedBox(
                height: 160,
                child: Image.asset(
                  AssetPath.signIn,
                  height: 180,
                  width: 180,
                  //color: Colors.yellow,
                ),
              ),
              const Text('Login Here',
                  style: TextStyle(
                      fontSize: 30,
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
                        color: Colors.black)),
              ),
              const SizedBox(height: 20),
              // const SizedBox(height: 5),
              TextFormField(
                controller: _emailTEController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  /*enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[400] ?? Colors.grey)),*/
                ),
              ),
              //const SizedBox(height: 15),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Password'),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),*/
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
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot your Password',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white)),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => signUp());
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(375, 50),
                      backgroundColor: Color(0x343a40),
                      foregroundColor: Colors.white),
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20),
                  )),
              TextButton(
                onPressed: () {},
                child: Text('Create New Account',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
