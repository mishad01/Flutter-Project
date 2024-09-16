import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:easy_msg/ui/widgets/background_widgets.dart';
import 'package:easy_msg/ui/widgets/user_image_picker.dart';
import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmTEController = TextEditingController();
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
                  //_selectedImage = pickedImage;
                },
              ),
              //const SizedBox(height: 20),
              // const SizedBox(height: 5),
              TextFieldColumn(),
              ElevatedButton(
                  onPressed: () {},
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
            /*enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[400] ?? Colors.grey)),*/
          ),
        ),
        //const SizedBox(height: 15),
        const SizedBox(height: 28),
        TextFormField(
          controller: _passwordTEController,
          obscureText: _obsecureText,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 28),
        TextFormField(
          controller: _passwordTEController,
          obscureText: _obsecureText,
          decoration: InputDecoration(
            hintText: 'Confirm Password',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}
