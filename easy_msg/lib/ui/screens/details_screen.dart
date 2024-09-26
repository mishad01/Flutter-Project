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

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: buildAppBar(),
        body: Center(
          child: _isLoading
              ? CircularProgressIndicator() // Loading indicator
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /*Container(
                        width: 150.0,
                        height: 150.0,
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
                            size: 50,
                          ),
                        ),
                      ),*/
                      /* SizedBox(height: 20),
                      const Text(
                        'Have a great day and enjoy your logout',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),*/
                      /*Flexible(
                        child: ListView.builder(
                          itemCount: profileData.length,
                          itemBuilder: (context, index) {
                            ProfileData profData = profileData[index];
                            return GestureDetector(
                              onTap: () async {
                                await FirebaseAuth.instance.signOut();
                                Get.offAllNamed('/1');
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.all(8.0),
                                leading: Icon(profData.icon),
                                title: Text(profData.text,
                                    style: TextStyle(fontSize: 18)),
                              ),
                            );
                          },
                        ),
                      ),*/
                      buildCard('Your Profile', Icons.person),
                      buildCard('Your Profile', Icons.settings),
                      buildCard('Your Profile', Icons.logout),
                      IconButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Get.offAllNamed('/1');
                          },
                          icon: Icon(Icons.logout, color: Colors.black))
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget buildCard(String text, IconData icon) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Card(
        color: Colors.grey.shade100,
        elevation: 2,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Icon(icon),
                SizedBox(width: 15),
                Text(text, style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      //toolbarHeight: 100,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff7d9eac),
            Color(0xff2e5e73),
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        )),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, ${username ?? 'User'}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // const Text(
          //   'Hope you are doing well',
          //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          // ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: _userImageUrl != null
                ? NetworkImage(_userImageUrl!)
                : AssetImage(AssetPath.logo) as ImageProvider,
          ),
        ),
        SizedBox(width: 10),
      ],
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
