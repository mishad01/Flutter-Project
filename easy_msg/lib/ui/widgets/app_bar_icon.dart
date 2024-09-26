import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    super.key,
    required this.iconData,
    required this.onTap,
  });
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      //backgroundColor: Colors.grey.shade200,
      child: IconButton(
        onPressed: () {},
        style: IconButton.styleFrom(backgroundColor: Colors.white),
        icon: Icon(
          iconData,
        ),
      ),
    );
  }
}
