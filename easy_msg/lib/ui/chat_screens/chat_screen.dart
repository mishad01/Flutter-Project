import 'package:easy_msg/ui/controller/sign_in_controller.dart';
import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:easy_msg/ui/widgets/chat_message.dart';
import 'package:easy_msg/ui/widgets/new_message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setUpPushNotification() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    //final notificationSettings = await fcm.requestPermission();
    final token = await fcm.getToken();
    print(token);
  }

  @override
  void initState() {
    super.initState();
    // Initialize the SignInController
    Get.put(SignInController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: ,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetPath.backgroundImg), fit: BoxFit.cover)),
        child: const Column(
          children: [
            Expanded(child: ChatMessage()),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
