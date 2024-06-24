import 'package:flutter/material.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/background_widgets.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidgets(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 160),
              Text(
                'Your Email Address',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'A 6 digit verification pin will send to your email address',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const SizedBox(height: 10),
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: 'Have account?  ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.4,
                    ),
                    children: [
                      TextSpan(
                          text: 'Sign In',
                          style: TextStyle(color: AppColors.themeColor))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
