import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actionIcon,
  });

  final String title;
  final String? actionIcon;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      //toolbarHeight: 100,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(22.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      title: Text(
        title,
        style: textTheme.bodyLarge!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      centerTitle: true,
      actions: [
        if (actionIcon != null)
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: IconButton(
              onPressed: () {
                // Define action here if needed
              },
              icon: ImageIcon(
                AssetImage(actionIcon!),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
