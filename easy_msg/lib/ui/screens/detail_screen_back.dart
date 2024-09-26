import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_msg/ui/screens/settings_screen.dart';
import 'package:easy_msg/ui/utility/asset_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class DetailsScreenBack extends StatefulWidget {
  const DetailsScreenBack({super.key});

  @override
  State<DetailsScreenBack> createState() => _DetailsScreenBackState();
}

class _DetailsScreenBackState extends State<DetailsScreenBack> {
  final User authenticatedUser = FirebaseAuth.instance.currentUser!;
  String? _userImageUrl;
  String? _userName;
  String? _userEmail;
  String? _userFullName;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserImage();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            /*---Profile Image---*/
            _buildProfileImage(),
            /*---Details---*/
            _buildDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: 450,
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
              buildDisplayText('Display Name', ' $_userFullName'),
              const Gap(10),
              buildDisplayText('Email Address', '$_userEmail'),
              const Gap(10),
              buildDisplayText('Phone Number', ' 019xxxxxxxx'),
              const Gap(40),
              buildCard(
                'Settings',
                Icons.settings,
                () {
                  Get.to(() => SettingsScreen(
                        name: _userFullName!,
                      ));
                },
              ),
              buildCard(
                'Logout',
                Icons.logout,
                () async {
                  await FirebaseAuth.instance.signOut();
                  Get.offAllNamed('/1');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
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
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter, // Align at the top center
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20.0), // Optional padding from the top
                child: CircleAvatar(
                  radius: 70, // Adjusted size as needed
                  backgroundImage: _userImageUrl != null
                      ? NetworkImage(_userImageUrl!)
                      : AssetImage(AssetPath.logo) as ImageProvider,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '$_userFullName',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              '@$_userName',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String text, IconData icon, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Card(
        elevation: 2,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  Color(0xff7d9eac),
                  Color(0xff2e5e73),
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Icon(icon, color: Colors.white),
                SizedBox(width: 15),
                Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
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
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 1)),
          Text(name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
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
          _userName = userDoc['username'];
          _userEmail = userDoc['email'];
          _userFullName = userDoc['full_name'];
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
