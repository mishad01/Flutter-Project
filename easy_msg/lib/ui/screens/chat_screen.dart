import 'package:easy_msg/ui/controller/sign_in_controller.dart';
import 'package:easy_msg/ui/utility/app_color.dart';
import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:easy_msg/ui/widgets/app_bar_icon.dart';
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
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // backToHome();
      },
      child: Scaffold(
        appBar: buildAppBar(),
        body: Container(
          //height: ,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetPath.chatBg), fit: BoxFit.cover)),
          child: const Column(
            children: [
              Expanded(child: ChatMessage()),
              NewMessage(),
            ],
          ),
        ),
      ),
    );
  }
}

/*void backToHome() {
  return Get.find<BottomNavBarController>().backToHome();
}*/

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: AppColor.themeColor,
    title: const Text(
      'Easy Message',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    actions: [
      AppBarIcon(
        iconData: Icons.phone_outlined,
        onTap: () {},
      ),
      const SizedBox(width: 10),
      /*Padding(
        padding: const EdgeInsets.only(right: 10),
        child: AppBarIcon(
          iconData: Icons.notifications_outlined,
          onTap: () {
            print('preseeeeeeeeeeeeeeed');
          },
        ),
      ),*/
    ],
  );
}
