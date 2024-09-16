import 'package:easy_msg/ui/chat_screens/chat_screen.dart';
import 'package:easy_msg/ui/controller/sign_in_controller.dart';
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
  //final FirebaseAuthServices _auth = FirebaseAuthServices();
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundWidgets(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                GetBuilder<SignInController>(builder: (signInController) {
                  return Visibility(
                    visible: !signInController.signInApiInProgress,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: ElevatedButton(
                        onPressed: _onTapNextButton,
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(375, 50),
                            backgroundColor: Color(0x343a40),
                            foregroundColor: Colors.white),
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 20),
                        )),
                  );
                }),
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
      ),
    ));
  }

  Future<void> _onTapNextButton() async {
    if (_formState.currentState!.validate()) {
      final bool result = await Get.find<SignInController>().signIn(
        _emailTEController.text.trim(),
        _passwordTEController.text,
      );
      if (result) {
        Get.offAll(() => ChatScreen());
      } else {
        if (mounted) {
          Get.snackbar('Error', 'Some issue occured');
        }
      }
    }
  }

  /*void signIn() async {
    String email = _emailTEController.text;
    String password = _passwordTEController.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if (user != null) {
      Get.offAllNamed("/chatScreen");
      */ /*Get.snackbar(
        'Welcome',
        '',
        padding: EdgeInsets.symmetric(horizontal: 16),
        margin: EdgeInsets.symmetric(horizontal: 16),
      );*/ /*
    } else {
      Get.snackbar('Error', 'Some error Occurred',
          backgroundColor: Colors.red,
          titleText: const Text(
            'Error',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
          messageText: const Text('Some error occurred',
              style: TextStyle(fontSize: 14, color: Colors.white)));
    }
  }*/

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
