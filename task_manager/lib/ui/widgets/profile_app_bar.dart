import 'package:flutter/material.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/network_cached_image.dart';

AppBar profileAppBar() {
  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading: const Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        child: NetworkCachedImage(url: ''),
      ),
    ),
    title: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dummy Name',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        Text(
          'xyz@gmail.com',
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ],
    ),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
  );
}
