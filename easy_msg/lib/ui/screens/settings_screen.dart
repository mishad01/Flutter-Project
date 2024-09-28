import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.name});
  final String name;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final User authenticatedUser = FirebaseAuth.instance.currentUser!;
  String? _userImageUrl;
  String? username;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: BoxDecoration(),
      //appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff7d9eac),
                  Color(0xff2e5e73),
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 60, left: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:
                              Icon(Icons.arrow_back_ios, color: Colors.white)),
                      Gap(90),
                      const Text('Settings',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 677,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Align(
                            alignment:
                                Alignment.topCenter, // Align at the top center
                            child: CircleAvatar(
                              radius: 60, // Adjusted size as needed
                              backgroundImage: _userImageUrl != null
                                  ? NetworkImage(_userImageUrl!)
                                  : const AssetImage(AssetPath.logo)
                                      as ImageProvider,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                            child: buildDisplayText(
                                widget.name, ' Never Give Up')),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.qr_code),
                        )
                      ],
                    ),
                    const Gap(20),
                    buildCard('Account', Icons.lock, () {},
                        'Privacy, security, change number'),
                    buildCard('Chat', Icons.chat, () {},
                        'Chat history, theme, wallpaper'),
                    buildCard('Notifications', Icons.notifications, () {},
                        'Messages, group and others'),
                    buildCard(
                      'Help',
                      Icons.help_outline,
                      () {},
                      'Help center,contact us, privacy policy',
                    ),
                    buildCard('Storage and data', Icons.storage, () {},
                        'Help center,contact us, privacy policy'),
                    buildCard(
                      'Invite a friend',
                      Icons.person_add,
                      () {},
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCard(String text, IconData icon, VoidCallback onTap,
      [String? detail]) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Card(
        elevation: 2,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  Color(0xff7d9eac),
                  Color(0xff2e5e73),
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(text,
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    if (detail != null)
                      Text(
                        detail,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDisplayText(String header, String name) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1)),
          Text(name,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }

  Future<void> _fetchUserImage() async {
    try {
      // Retrieve the user's image URL from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(authenticatedUser.uid)
          .get();
      if (userDoc.exists) {
        setState(() {
          _userImageUrl = userDoc['image_url'];
          username = userDoc['username'];
        });
      }
    } catch (error) {
      print('Error fetching user image: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user data. Please try again.')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
