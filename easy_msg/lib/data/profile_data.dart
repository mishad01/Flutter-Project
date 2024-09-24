import 'package:flutter/material.dart';

class ProfileData {
  final IconData icon;
  final String text;

  ProfileData({required this.icon, required this.text});
}

List<ProfileData> profileData = [
  ProfileData(icon: Icons.person, text: 'Your profile'),
  /*ProfileData(icon: Icons.payment, text: 'Payment Methods'),
  ProfileData(icon: Icons.shopping_cart, text: 'My Orders'),*/
  ProfileData(icon: Icons.settings, text: 'Settings'),
  /*ProfileData(icon: Icons.help, text: 'Help Center'),
  ProfileData(icon: Icons.privacy_tip, text: 'Privacy Policy'),
  ProfileData(icon: Icons.group_add, text: 'Invite Friends'),*/
  ProfileData(icon: Icons.logout, text: 'Log out'),
];
