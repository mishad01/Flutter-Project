import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final User authenticatedUser = FirebaseAuth.instance.currentUser!;
  String? _userImageUrl;
  String? username;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserImage();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator() // Loading indicator
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        image: DecorationImage(
                            image: AssetImage(AssetPath.chatBg),
                            fit: BoxFit.cover)),
                    child: IconButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Get.offAllNamed('/1');
                      },
                      icon: Icon(
                        Icons.logout,
                        size: 100,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text('Have a great day and enjoy your logout'),
                ],
              ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xffb6bd6e), Color(0xffaaba77), Color(0xffa1b67d)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hello, ${username ?? 'User'}'),
          const Text('Hope you are doing well'),
        ],
      ),
      actions: [
        CircleAvatar(
          radius: 30,
          backgroundImage: _userImageUrl != null
              ? NetworkImage(_userImageUrl!)
              : AssetImage(AssetPath.logo) as ImageProvider,
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
