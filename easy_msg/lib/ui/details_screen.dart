import 'package:easy_msg/ui/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    toolbarHeight: 100,
    backgroundColor: Colors.white,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Hello Sakif'),
        const Text('Hope you are doing well'),
      ],
    ),
    actions: [
      AppBarIcon(
        iconData: Icons.phone_outlined,
        onTap: () {},
      ),
      const SizedBox(width: 10),
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: AppBarIcon(
          iconData: Icons.notifications_outlined,
          onTap: () {
            print('preseeeeeeeeeeeeeeed');
          },
        ),
      ),
    ],
  );
}
